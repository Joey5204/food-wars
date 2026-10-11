# Local verification: formatting, sourcemap, and strict type check.
# Run from anywhere:  powershell -File scripts/verify.ps1
# Requires the tools pinned in rokit.toml (run `rokit install` first).
$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

# Rokit may have been installed after this terminal opened.
$RokitBin = Join-Path $env:USERPROFILE ".rokit/bin"
if (Test-Path $RokitBin) { $env:PATH = "$RokitBin;" + $env:PATH }

$LuauLspVersion = "1.70.1" # keep in sync with rokit.toml
$TypesDir = ".cache"
$TypesFile = Join-Path $TypesDir "globalTypes.d.luau"
$TypesUrl = "https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/$LuauLspVersion/scripts/globalTypes.d.luau"

foreach ($tool in "rojo", "stylua", "luau-lsp") {
	if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
		Write-Host "Missing '$tool'. Run: rokit install"
		exit 1
	}
}

if (-not (Test-Path $TypesFile)) {
	Write-Host "Downloading Roblox type definitions (luau-lsp $LuauLspVersion)..."
	New-Item -ItemType Directory -Force -Path $TypesDir | Out-Null
	Invoke-WebRequest -Uri $TypesUrl -OutFile $TypesFile
}

Write-Host "1/3 Generating sourcemap..."
rojo sourcemap dev.project.json -o sourcemap.json
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "2/3 Checking formatting (StyLua)..."
stylua --check src dev tests
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "3/3 Type checking (luau-lsp analyze)..."
# The pinned Windows language server cannot analyze non-ASCII workspace paths.
# Use an isolated temporary copy for type checking when necessary.
$ProjectRoot = (Get-Location).Path
if ($ProjectRoot -match '[^\x00-\x7F]') {
	$TaskTempRoot = [System.IO.Path]::GetFullPath([System.IO.Path]::GetTempPath())
	$CheckDir = Join-Path $TaskTempRoot ("foodwars-verify-" + [guid]::NewGuid().ToString("N"))
	if ($CheckDir -match '[^\x00-\x7F]') { throw "Type checker needs an ASCII temporary path." }
	New-Item -ItemType Directory -Path $CheckDir | Out-Null
	try {
		foreach ($item in "src", "dev", "tests", "dev.project.json", ".luaurc", "rokit.toml") {
			Copy-Item -LiteralPath $item -Destination $CheckDir -Recurse
		}
		Copy-Item -LiteralPath $TypesFile -Destination (Join-Path $CheckDir "globalTypes.d.luau")
		Set-Location $CheckDir
		rojo sourcemap dev.project.json -o sourcemap.json
		if ($LASTEXITCODE -ne 0) { throw "Temporary sourcemap generation failed." }
		luau-lsp analyze --sourcemap=sourcemap.json --definitions=globalTypes.d.luau --base-luaurc=.luaurc src dev tests
		$TypeExitCode = $LASTEXITCODE
	} finally {
		Set-Location $ProjectRoot
		$ResolvedCheckDir = [System.IO.Path]::GetFullPath($CheckDir)
		if ($ResolvedCheckDir.StartsWith($TaskTempRoot, [System.StringComparison]::OrdinalIgnoreCase) -and
			[System.IO.Path]::GetFileName($ResolvedCheckDir) -match '^foodwars-verify-[a-f0-9]{32}$') {
			Remove-Item -LiteralPath $ResolvedCheckDir -Recurse -Force
		}
	}
} else {
	luau-lsp analyze --sourcemap=sourcemap.json --definitions=$TypesFile --base-luaurc=.luaurc src dev tests
	$TypeExitCode = $LASTEXITCODE
}
if ($TypeExitCode -ne 0) { exit $TypeExitCode }

Write-Host "OK: verification passed."

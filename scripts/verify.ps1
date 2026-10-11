# Local verification: formatting, sourcemap, and strict type check.
# Run from anywhere:  powershell -File scripts/verify.ps1
# Requires the tools pinned in rokit.toml (run `rokit install` first).
$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

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
rojo sourcemap default.project.json -o sourcemap.json
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "2/3 Checking formatting (StyLua)..."
stylua --check src tests
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "3/3 Type checking (luau-lsp analyze)..."
luau-lsp analyze --sourcemap=sourcemap.json --definitions=$TypesFile --base-luaurc=.luaurc src tests
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "OK: verification passed."

param(
	[ValidateSet("development", "production")]
	[string]$Environment = "development"
)

$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")
$RokitBin = Join-Path $env:USERPROFILE ".rokit/bin"
if (Test-Path $RokitBin) { $env:PATH = "$RokitBin;" + $env:PATH }
if (-not (Get-Command rojo -ErrorAction SilentlyContinue)) {
	throw "Rojo is missing. Run rokit install in the repository first."
}

New-Item -ItemType Directory -Force -Path build | Out-Null
if ($Environment -eq "production") {
	$Project = "default.project.json"
	$Output = "build/FoodWarsProduction.rbxlx"
} else {
	$Project = "dev.project.json"
	$Output = "build/FoodWarsDev.rbxlx"
}

rojo build $Project -o $Output
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host "Created $Output. This contains code; merge with your asset snapshot before publishing."
Write-Host "No tests were run."

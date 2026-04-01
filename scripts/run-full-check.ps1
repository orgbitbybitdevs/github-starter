$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
& (Join-Path $scriptDir "verify-setup.ps1") -Stage full
exit $LASTEXITCODE

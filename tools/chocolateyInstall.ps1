$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/0f5cfdc2c8c2433028842e16dc5ac1a65da24292/azuredatastudio-windows-setup-1.29.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '5242FFC3BD3E31B44E3D3357BD994551D3ABA613A9DC740063362D6FF65A83D6'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

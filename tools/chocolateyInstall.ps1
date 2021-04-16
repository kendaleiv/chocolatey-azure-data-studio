$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/13e362762762e5cb76a5c8afd2bc650f48c2d3d8/azuredatastudio-windows-setup-1.28.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '561A3DD28EEB352F111D97297FDBFFD239EA0FA39E675F6BF32D04BC16805EC7'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

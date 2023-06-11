$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/8f53a316fa00a98264f1ab119641cd540b5af25c/azuredatastudio-windows-setup-1.44.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '6451e55f514a2d5af2e5991eccaa7a141c5959f786df5f77ca390ccb631e4c54'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

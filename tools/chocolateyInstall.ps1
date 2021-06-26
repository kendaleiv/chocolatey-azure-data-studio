$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/59c4b8e90cf2d3a24bed72623197f10f8d090fdc/azuredatastudio-windows-setup-1.30.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '83D42D6C2CFF3734EB883343DDE46DF947B533937FCD01DCC9069017A3B389D9'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

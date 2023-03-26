$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/22f384e569bc90d8b3231cc8c8cff99ea16c5052/azuredatastudio-windows-setup-1.42.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '39b5a69c1b1598859ecea46627adfd69693820fdd3de75084bf18dbcfccd8b2b'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/4a45ba7cf20dd4129f1a08e5e776dfb33e3d1d1e/azuredatastudio-windows-setup-1.32.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '558DDFE9C118CC4FDB751CA12B03688CF86ACAE247B57E1746D437CB106ADEA5'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

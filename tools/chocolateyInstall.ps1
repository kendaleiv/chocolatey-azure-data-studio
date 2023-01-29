$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/cf5e0fe1a33709e2a82dc94f42dbe88487803d62/azuredatastudio-windows-setup-1.41.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '2b09c315e4658cb12ab964afc503724c7593a706dfbcc4af7ea06ab51e73ffc2'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/31bee67f005648cdc9186f28ef39b4f1d6585e0f/azuredatastudio-windows-setup-1.44.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '1556fd4a72000c4ff1e9afcdcf1da669821997c6aa3d0045e95c1846166811f0'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

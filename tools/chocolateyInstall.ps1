$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/0f0960d0e774e1ce903b79378addff96117c27a6/azuredatastudio-windows-setup-1.41.2.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'bbfc1a6d8a3b115ed5eb668a611a6c0611d39d5f721c7e69ce26271745a72940'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

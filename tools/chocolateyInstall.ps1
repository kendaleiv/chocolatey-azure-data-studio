$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/e56e1d931bbb110fe8f24751423c4e184bb8f22d/azuredatastudio-windows-setup-1.36.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '167a0eff0018c5780266c3eab3d12d270746ab5d06419c59193bd4e1b20b58c7'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

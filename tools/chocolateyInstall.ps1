$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/b6f7beb01f92adaa4b79b6b6f3ac704e95cafe6e/azuredatastudio-windows-setup-1.47.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '9c59b9d407b2f420299e657d4bba03879ab0b5c764de175471b74f20fa8a4b1b'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

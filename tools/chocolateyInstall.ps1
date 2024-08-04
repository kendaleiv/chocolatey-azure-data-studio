$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://download.microsoft.com/download/5/9/6/59609041-db64-475c-b82a-2b5795b904b7/azuredatastudio-windows-setup-1.49.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '675129933287538e86f88d6396ebc601a6c8d7d9e507fbd0c5cfe4799db263b8'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

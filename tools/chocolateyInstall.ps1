$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://azuredatastudiobuilds.blob.core.windows.net/releases/1.13.1/azuredatastudio-windows-setup-1.13.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'CF68B146ECE44C73E9C894C212E2DD13625BCCB6CA8E3A9E898EDC6FB0834DD0'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

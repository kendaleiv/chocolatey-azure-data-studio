$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/4970733324ef8254b7c22a5dc55af7f8a1dea93f/azuredatastudio-windows-setup-1.48.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'f17014e0bdc529e3b9f2f323f7e4ac827c2d68e18724dad7b7fb972562262161'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://azuredatastudiobuilds.blob.core.windows.net/releases/1.13.0/azuredatastudio-windows-setup-1.13.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'C046124069B24335BE378D3E2AB80371E6F7ABFF0014AE59168DAF0B41EB112F'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

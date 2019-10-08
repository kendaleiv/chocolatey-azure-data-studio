$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://azuredatastudiobuilds.blob.core.windows.net/releases/1.12.1/azuredatastudio-windows-setup-1.12.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '103581E77C54F82E6BCECC592FE959541AB2DED7B9591B941C2AC4AA460CCB1E'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

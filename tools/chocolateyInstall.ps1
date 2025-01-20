$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://download.microsoft.com/download/4/d/b/4dbf3bbc-418c-42db-ae0d-a52135b7d991/azuredatastudio-windows-setup-1.50.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'D07EC37B93941038926441DA67A28B3F48491B05CE370DA91B49D007DB888AB4'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

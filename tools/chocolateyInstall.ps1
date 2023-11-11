$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/c7c2b2f21505562d21972d4c135119d00806db4f/azuredatastudio-windows-setup-1.47.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '57880d3aa603c0fe4a9b54d34cc478f97cc52afa6c8a26f55a3786e2d1370bbd'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

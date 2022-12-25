$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/3a32679ab590c1023ab4de6f191769e7e127d25b/azuredatastudio-windows-setup-1.40.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'eea2dad78606380c2c3cf1b16940375869979ae93ed0f2fc340178d4ab44d417'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

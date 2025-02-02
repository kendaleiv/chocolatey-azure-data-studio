$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://download.microsoft.com/download/a/2/2/a222c9c8-e699-4719-81e5-073948c89e28/azuredatastudio-windows-setup-1.51.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '652B2BAF394F8DEF5391347C13CB4CCD65A833F87E1DD104B867ED3C1C89C048'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

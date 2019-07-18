$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://go.microsoft.com/fwlink/?linkid=2098450'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'EB2CBAC084117980D7319485796E3465DB10F09F2567422AE9C16E2114BCB871'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

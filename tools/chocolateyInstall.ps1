$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/39449bbe88a0bc4092c9b205cad10d0a556beffd/azuredatastudio-windows-setup-1.46.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'c14b88698a5f9b312c1c5a7709456fa89bfeb717e2081fd2c7e1ab50e820b0c3'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

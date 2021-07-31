$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/65fb22cc7c36db9c53af1ed2fdbdf48f66c682be/azuredatastudio-windows-setup-1.31.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '6F4F22193C3CA43C6A52B347B7E4ACBE4ADE3E1E468607E0A4566FE992548296'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

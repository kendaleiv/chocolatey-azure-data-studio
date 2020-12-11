$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/e7eacc32c0d20bd4da843320c3bfac231b308c98/azuredatastudio-windows-setup-1.25.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'AA5DCC04EE4CD130EEFD82F94B57CBBBBEF511A3FF6AAD44C9B0D066102B8115'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

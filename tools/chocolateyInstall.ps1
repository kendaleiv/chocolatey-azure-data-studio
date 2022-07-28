$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/dff93c4736269ef2a7e8a225737a0d8354bf0246/azuredatastudio-windows-setup-1.38.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'faaa64f370ca13c90e6a9a4cf99316e6dc3d058ac36decf860e6a0cb7cd47ec9'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

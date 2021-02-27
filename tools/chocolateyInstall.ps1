$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/796abbdf5fdd341e3528e30a6b777c93e115eb02/azuredatastudio-windows-setup-1.26.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'BCBEB40C460D196A6F7A5833C78F4E54E961B8D9AAB098E49B88418B4796476B'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

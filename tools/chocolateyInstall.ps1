$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/fe6312306647441b30102a64bb43abb06ebcf2be/azuredatastudio-windows-setup-1.20.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'EDEAFBC1B2A0CA0F73E4B6C0C670684426239C9B78F1CE3524911FF5980DEA9E'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

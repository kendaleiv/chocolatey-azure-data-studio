$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/83a4316cf89cbf961a0f09a72c861379cfd01fa9/azuredatastudio-windows-setup-1.34.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '7894213f15af0a42472e6c3e0893e0187c2ecb58058e18d9100b9ec3b8f81047'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

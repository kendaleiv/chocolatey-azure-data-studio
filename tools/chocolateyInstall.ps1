$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/3fbaa3de931ef433090fe3deb8c89cba99d7952b/azuredatastudio-windows-setup-1.40.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '6f60298fb84d9f6c3a7c679bb646b2d1a619d3d36e30fdc2e01f47a779e9df45'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/2413919f186f780f0193d047da3d90bb3c1e9bf6/azuredatastudio-windows-setup-1.21.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'F209B4A41EC11C17B22F1EA47EA5D090B524BC2EE4DA2A2AE4B715746F604ABC'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

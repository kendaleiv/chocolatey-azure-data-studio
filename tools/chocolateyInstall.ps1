$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/9fdb2161d49b4d4ab6798809faa042a898ca2eae/azuredatastudio-windows-setup-1.39.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '7d5b6c7dc55946855372d5f96fc9f52516a35ada63b2e18b6264ca5d2b287dbd'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

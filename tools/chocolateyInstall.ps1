$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://azuredatastudiobuilds.blob.core.windows.net/releases/1.14.1/azuredatastudio-windows-setup-1.14.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'A7C90B7AA5D0218E488795342DA258D1C541D3AC7C7A62690277C0818228EF7E'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/e9c8eb8564f537726b36b5f15c7f35e62f229284/azuredatastudio-windows-setup-1.35.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'ce94384d038b5378c594ed3bd975c411010c8e5bfda849666dbf8ea8fd2e8572'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

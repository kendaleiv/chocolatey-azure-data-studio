$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://download.microsoft.com/download/380cb128-f316-418f-b60a-963454e34173/azuredatastudio-windows-setup-1.51.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '813137F4AEAA231FA28E5169C57D466C986251C92DC50982C90B7EFAAAA630B4'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

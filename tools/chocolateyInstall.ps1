$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/765c7064d46253d88393e0e1ff78874b6fe8fa64/azuredatastudio-windows-setup-1.27.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'F333CB5F4E683FE4A12D93751D3AB9DE282E5F00017FB49690C4556C7444085C'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

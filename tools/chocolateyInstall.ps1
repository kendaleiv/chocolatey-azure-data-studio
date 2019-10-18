$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://azuredatastudiobuilds.blob.core.windows.net/releases/1.12.2/azuredatastudio-windows-setup-1.12.2.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '1B22C571933DEFEC55250D126027BEA0DB4B0A0B08A553B99E64763FDD344746'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

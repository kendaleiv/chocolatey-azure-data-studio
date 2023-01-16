$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/661384637db384fe5d4e6224069adbe708580b16/azuredatastudio-windows-setup-1.40.2.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '88b455affe1c2d523e85fba85408517c885a47bc3df2ec88985b204989a83445'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

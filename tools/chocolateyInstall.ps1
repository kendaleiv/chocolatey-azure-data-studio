$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/eb3c0f5d9df86b9490606aab7fffaa253b0aca4d/azuredatastudio-windows-setup-1.24.0.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '29436EC6EE8AA4E5721B801B6A0658DD5CD37AA404ACD2AED09142E56DD00824'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/4d4917d328ab7a7526817a0f0ef03237a79aa54d/azuredatastudio-windows-setup-1.25.2.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'D118ADE37B411F51FAE39CA3C7EFDB9A723E37CD3B02E61B71337F7AED5F3028'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

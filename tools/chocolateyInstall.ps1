$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://sqlopsbuilds.azureedge.net/stable/b277eafb8f5328ea26c6edfddd1999292ac27937/azuredatastudio-windows-setup-1.25.3.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = 'BF8A8783F7B87ACA38B4E89D93C0F43779BE00866EE5D44F189BB0922FED0EA9'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

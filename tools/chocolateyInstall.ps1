$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$mergeTasks = "!runCode"
Write-Host "Merge Tasks: `n$mergeTasks"

$packageArgs = @{
  packageName    = 'azure-data-studio'
  fileType       = 'EXE'
  url64bit       = 'https://download.microsoft.com/download/7/8/3/783c2037-8607-43c4-a593-0936e965d38b/azuredatastudio-windows-setup-1.49.1.exe'

  softwareName   = 'Azure Data Studio'

  checksum64     = '153A345F15F7CAB8BB5F95C6F485751DF0108C04906583D143E5ADC2AC6A21CC'
  checksumType64 = 'sha256'

  silentArgs     = "/verysilent /suppressmsgboxes /mergetasks=""$mergeTasks"" /log=""$env:temp\azure-data-studio.log"""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

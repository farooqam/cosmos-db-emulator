$HostDirectory = Join-Path -Path ${env:LOCALAPPDATA} -ChildPath "azure-cosmosdb-emulator.hostd"

Push-Location $HostDirectory
.\importcert.ps1
Pop-Location

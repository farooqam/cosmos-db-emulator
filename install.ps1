$DockerVersionInfo = docker version

if ($DockerVersionInfo[16].Contains("windows/amd64") -eq $False)
{
    Write-Error "Enable Windows containers then re-run this script."
    return
}

$DockerImageName = "microsoft/azure-cosmosdb-emulator"

docker pull $DockerImageName

$ContainerName = "azure-cosmosdb-emulator"
$HostDirectory = Join-Path -Path ${env:LOCALAPPDATA} -ChildPath "azure-cosmosdb-emulator.hostd"
New-Item -ItemType Directory -Path $HostDirectory -Force

docker run --name $ContainerName --memory 2GB --mount "type=bind,source=$HostDirectory,destination=C:\CosmosDB.Emulator\bind-mount" `
     --tty --interactive -p 8081:8081 -p 8900:8900 -p 8901:8901 -p 8979:8979 -p 10250:10250 -p 10251:10251 -p 10252:10252 -p 10253:10253 `
     -p 10254:10254 -p 10255:10255 -p 10256:10256 -p 10350:10350 $DockerImageName




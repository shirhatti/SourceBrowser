param (
    [string]$OutDir = "$PSScriptRoot\out",
    [string]$MSBuildExePath = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MSBuild.exe"
)
$progressPreference = 'silentlyContinue'
$env:DOTNET_CLI_TELEMETRY_OPTOUT=1
. $PSScriptRoot\grpc-dotnet\build\get-dotnet.ps1
. $PSScriptRoot\grpc-dotnet\activate.ps1
dotnet restore
dotnet msbuild
dotnet restore .\grpc-dotnet\Grpc.DotNet.sln

$env:MSBuildSdksPath=(Resolve-Path -Path "$PSScriptRoot\grpc-dotnet\.dotnet\sdk\*\Sdks\")[0].Path
$env:MSBUILD_EXE_PATH=$MSBuildExePath
.\src\HtmlGenerator\bin\Debug\net472\HtmlGenerator.exe /out:$outDir /force .\grpc-dotnet\Grpc.DotNet.sln
$progressPreference = 'Continue'

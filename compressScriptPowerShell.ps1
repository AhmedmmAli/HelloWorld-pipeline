Get-ChildItem HelloWorldSolution/windowsOutputFolder/ windowsBuildLogs.txt -Recurse|Compress-Archive -DestinationPath windowsLogs.zip
Get-ChildItem  HelloWorldSolution/ubuntuOutputFolder/ ubuntuBuildLogs.txt -Recurse|Compress-Archive -DestinationPath ubuntuLogs.zip


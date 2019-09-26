pipeline{
        agent any
        stages{
                stage ('Build App'){
                        steps{
                                script{
					if (env.BRANCH_NAME.equals('release/*') ){
                                        if (isUnix()) {
                                                sh """
                                                        dotnet build HelloWorldSolution -r win-x64 -o windowsOutputFolder/ > windowsBuildLogs.txt
                                                        dotnet build HelloWorldSolution -r linux-x64 -o ubuntuOutputFolder/ > ubuntuBuildLogs.txt
                                                        ls
                                                """
                                        } else {
                                                bat """
                                                        dotnet build HelloWorldSolution -r win-x64 -o windowsOutputFolder/ > windowsBuildLogs.txt
                                                        dotnet build HelloWorldSolution -r linux-x64 -o ubuntuOutputFolder/ > ubuntuBuildLogs.txt
                                                """
                                        }}
                                }
                        }
                }
                stage ('Run UnitTest'){
                        steps{
                                script{
					if (env.BRANCH_NAME.equals('release/*') ){
                                        if (isUnix()) {
                                                sh 'dotnet test HelloWorldTest'
                                        } else {
                                                bat 'dotnet test HelloWorldTest'
                                        }}
                                }
                        }
                }
                stage ('Run the lint Checks'){
                        steps{
                                script{
					if (env.BRANCH_NAME.equals('release/*') ){
                                        if (isUnix()) {
                                                echo "The lint test will run here"
                                        } else {
                                                echo "The lint test will run here"
                                        }}
                                }
                        }
                }
	}
}


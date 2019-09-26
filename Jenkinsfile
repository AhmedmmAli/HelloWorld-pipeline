//########################################################################################################################
//#                                                                                                                      #
//#   This the begining of the pipeline. i will be better to run this pipeline on ubuntu slave, and you will find        #
//#   the output of the build saved in a file called ubuntuBuildLogs.txt                                                 #
//#                                                                                                                      #
//########################################################################################################################
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
                  //###############################################################
                 //          This stage to run the UnitTest                       #
                //#################################################################
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
                  //###################################################################################################
                 //                       This stage to run the dummy lint checks                                    #
                //###################################################################################################
                stage ('Run the lint Checks'){
                        steps{
                                script{
					if (env.BRANCH_NAME.equals('release/*') ){
                                        if (isUnix()) {
                                                dotnet  add HelloWorldSolution package StyleCop.Analyzers
                                        }}
                                }
                        }
                }
                  //######################################################################################
                 //          This stage will run the integration test on the master branch              #
                //######################################################################################

                stage ('Run the integration test on the master branch'){
                        steps{
                                script{
                                        if (env.BRANCH_NAME.equals('master') ){
                                                if (isUnix()) {
                                                        sh 'dotnet test HelloWorldSolutions.Tests'
                                                } else {
                                                        bat 'dotnet test HelloWorldSolutions.Tests'
                                                }
                                        }
                                }
                        }
                }
                  //#######################################################################################################
                 //          This stage to compress the build output to  ubuntuBuildOutput_$BUILD_NUMBER.tar.gz           #
                //########################################################################################################
                stage ('Store the build output along with a build log'){
                        steps{
                                script{
                                                if (isUnix()) {
                                                        sh '''
                                                        chmod u+x compressScript
                                                        ./compressScript
                                                        '''
                                                }
                                        }
                                }
                        }


	}
}


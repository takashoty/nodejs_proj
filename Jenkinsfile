pipeline {
    agent any
    environment {
        imagename = 'nodejs_task'
        registry = '316557878974.dkr.ecr.eu-west-3.amazonaws.com/nodejs_task'
        registryCredential = 'aws_access'

    }

    stages {
        stage('gitclone') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/takashoty/nodejs_proj.git']]])
            }
        }
        stage('buildit') {
            steps {
                script {
                    dockerImage = docker.build imagename
                }
            }
        }
        stage ('Deploy Image to ECR') {
            steps {
                script {
                    docker.withRegistry("https://" + registry, "ecr:eu-west-3:" + registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage ('Uploading data to s3') {
            steps {
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: '', excludedFile: '', flatten: false, gzipFiles: true, keepForever: false, managedArtifacts: true, noUploadOnFailure: false, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'SUCCESS', profileName: 's3-mybucket', userMetadata: []
            }
        }
        stage ('Clean Workspace') {
            steps {
                cleanWs()
            }
        }
    }
}
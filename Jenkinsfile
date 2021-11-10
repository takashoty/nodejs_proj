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
        stage ('Clean Workspace') {
            steps {
                cleanWS()
            }
        }
    }
}
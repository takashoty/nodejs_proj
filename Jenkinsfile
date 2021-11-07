pipeline {
    agent any
    environment {
        imagename = "takashoty/jenkins"
        registryCredential = "dockerhub"
        USERNAME = "takashoty"
        TOKEN = "88600a17-987a-474c-9941-88ad37c5b951"
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
        stage ('Deploy Image') {
            steps {
                sh "docker login -u $USERNAME -p $TOKEN"
                sh "docker tag $imagename $imagename:latest"
                sh "docker tag $imagename:latest $imagename:v1.0.$BUILD_NUMBER"
                sh "docker push $imagename:latest && docker push $imagename:v1.0.$BUILD_NUMBER"

            }
        }
        stage ('Delete image') {
            steps {
                sh "docker rmi $imagename:v1.0.$BUILD_NUMBER"
                sh "docker rmi $imagename:latest"
            }
        }
        stage ('Clean Workspace') {
            steps {
                cleanWS()
            }
        }
    }
}

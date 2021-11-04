pipeline {
    agent {
        docker { image 'jenkins:agent }
    }
    stages {
        stage('docker-slave') {
            steps {
                sh 'node --version'
            }
        }
    }
}
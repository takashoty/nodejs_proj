pipeline {
  agent any
  stages {
    stage('gitclone') {
      steps {
        git(url: 'https://github.com/takashoty/nodejs_proj.git', branch: 'master', changelog: true, poll: true)
      }
    }

  }
}
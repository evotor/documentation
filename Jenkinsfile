pipeline {
  agent {
    docker {
      image 'docker-registry.market.local:443/jekyll:latest'
      args '-v .:/opt/src'
    }
  }
  stages {
    stage('Build') {
      steps {
        sh ''
      }
    }
  }
}

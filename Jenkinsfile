pipeline {
  agent {
    docker {
      image 'docker-registry.market.local:443/jekyll:latest'
      args '-v $PWD:/opt/src'
    }
  }
  stages {
    stage('Build') {
      steps {
        sh 'date'
      }
    }
  }
}

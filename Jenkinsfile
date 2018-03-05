pipeline {
  agent {
    docker {
      image 'docker-registry.market.local:443/jekyll:latest'
      args '-v $PWD:/opt/src --entrypoint "/usr/local/bin/bundle exec jekyll build"'
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

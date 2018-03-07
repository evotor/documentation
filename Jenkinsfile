pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '. ~/.rvm/scripts/rvm && bundle exec jekyll build'
      }
    }
  }
}

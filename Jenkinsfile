pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''#!/usr/bin/bash
             . ~/.rvm/scripts/rvm && bundle exec jekyll build
        '''
      }
    }
  }
}

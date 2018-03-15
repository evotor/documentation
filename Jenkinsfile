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
    stage('Deploy') {
      steps {
        sh '''#!/usr/bin/bash
              set -e
              arch=docs_${env.BUILD_TIMESTAMP}.tgz
              tar -czf ${arch} -C _site .
              echo "Deploing to ${env.SERVER_NAME}..."
              scp ${arch} ${env.SERVER_USER}@${env.SERVER_NAME}:/srv/www/docs-arch
              ssh -T ${env.SERVER_USER}@${env.SERVER_NAME}  << EOF
                cd /srv/www/docs2
                rm -rf /srv/www/docs2/*
                tar xzf /srv/www/docs-arch/${arch}
                rm /srv/www/docs-arch/${arch}
              EOF
              rm ${arch}
        '''
      }
    }
  }
}

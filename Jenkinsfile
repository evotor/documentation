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
              arch=docs_${BUILD_TIMESTAMP}.tgz
              tar -czf ${arch} --exclude-from=tar_exclude -C _site .
              echo "Deploing to ${SERVER_NAME}..."
              scp ${arch} ${SERVER_USER}@${SERVER_NAME}:/srv/www/docs-arch
              ssh -T ${SERVER_USER}@${SERVER_NAME}  << EOF
                cd /srv/www/docs
                rm -rf /srv/www/docs/*
                tar xzf /srv/www/docs-arch/${arch}
                find /srv/www/docs-arch/ -name "docs_*" -mtime +60 -exec rm {} \\;
EOF
              rm ${arch}
        '''
      }
    }
  }
}

pipeline {
  agent any
  stages {
    stage('Pull Upstream ChromiumOS Build') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Updating Source Code"
repo sync'''
      }
    }
  }
}
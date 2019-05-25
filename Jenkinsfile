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
    stage('Clean Up Previous Build') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Cleaning Up"
cros clean'''
      }
    }
    stage('Add My GPDPoclet Overlay to the Build') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
echo "Updating Board Overlay"
rm -rf cd /OSLab/ChromiumOS/src/overlays/overlay-gpdpocket
cd /OSLab/ChromiumOS/src/overlays/
git clone git@github.com:KeithIMyers/overlay-gpdpocket.git'''
      }
    }
    stage('Setup the Board') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Cleaning Up"
cros_sdk bash OSLab-initGPD.sh'''
      }
    }
    stage('Build Flashrom and Add it to the Board') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Adding Flashrom
cros_sdk bash OSLab-AddFlashrom.sh'''
      }
    }
  }
}
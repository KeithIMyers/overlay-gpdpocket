pipeline {
  agent any
  stages {
    stage('Pull Upstream ChromiumOS Build') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Updating Source Code"
repo sync --force-sync'''
      }
    }
    stage('Run OSLab Init Scripts') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Cleaning Up"
bash /OSLab/scripts/initOSLab '''
      }
    }
    stage('Add My GPDPocket Overlay to the Build') {
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
    stage('Add Custom Packages') {
      steps {
        sh '''#export PATH="$HOME/depot_tools:$PATH"
#umask 022
#cd /OSLab/ChromiumOS
#echo "Adding Flashrom"
#cros_sdk bash OSLab-AddFlashrom.sh'''
      }
    }
    stage('Build Core OS From Source') {
      steps {
        echo 'This is going to take a while, best to grab a coffee or take a nap'
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Starting Core OS"
cros_sdk bash OSLab-BuildOSCore.sh'''
      }
    }
    stage('Build Test Image') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Starting Core OS"
cros_sdk bash OSLab-BuildTestImage.sh'''
      }
    }
    stage('Create VM From Test Image') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Starting Core OS"
cros_sdk bash OSLab-CreateVMfromTestImage.sh'''
      }
    }
    stage('Spinning Up TestVM an Running Smoke Tests') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Spinning Up TestVM and Running Tests"
cros_sdk bash OSLab-RunUnitTests.sh'''
      }
    }
    stage('Building Release Image') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Since Unit Testing Passed, it is time to build release images."
cros_sdk bash OSLab-BuildRelease.sh'''
      }
    }
    stage('Creating OTA Package') {
      steps {
        sh '''export PATH="$HOME/depot_tools:$PATH"
umask 022
cd /OSLab/ChromiumOS
echo "Getting things ready"
cros_sdk bash OSLab-patchGPD'''
      }
    }
  }
}
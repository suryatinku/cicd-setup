pipeline {
    environment {
    registry = "suryatink/cicd"
    registryCredential = 'dockerhubcredentials'
    dockerImage = ''
    }

    agent any
    stages {
            stage('Cloning our Git') {
                steps {
                git 'https://github.com/suryatinku/cicd-setup.git'
                }
            }

        }
    }

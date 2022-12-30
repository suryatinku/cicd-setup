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
                git branch: 'main', credentialsId: 'git', url: 'https://github.com/suryatinku/cicd-setup.git'
                }
            }

        }
    }

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
        stage('Build-dockerfile') {
            steps {
                script{
                 dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }   
        
stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
      

        }
    }

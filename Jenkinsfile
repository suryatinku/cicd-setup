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
        
stage('Build & Push Image') {
      steps{
         script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER" 
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  
stage('success or abort'){
       steps{
          script {
             try {
                  input 'Deploy to UAT?'
    } 
       catch(err) {
                   currentBuild.result = 'SUCCESS'
                   return
    }
    }
    }
    }        

stage('Deploy') {
      steps{
            sh "docker pull suryatink/cicd:$BUILD_NUMBER"
            sh 'docker run -itd -p 5000:5000 --name calculator suryatink/cicd:$BUILD_NUMBER'
                }
            }         

        }
    }

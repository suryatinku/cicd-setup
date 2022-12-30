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
  
 stage("Validate before Apply") {
   timeout(time:30, unit:'MINUTES') {
   input 'Are you sure to promote this build to QA?'
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

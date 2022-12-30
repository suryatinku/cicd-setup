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
                 app = docker.build("suryatink/cicd")
                }
            }
        }   
        
    stage('Docker deploy') {
      agent any
      steps {
          sh 'docker run -itd -p 5000:5000 --name calculator suryatink/cicd:latest'
        }
      }
      

        }
    }

pipeline {
	agent any
	stages {
		stage('git checkout') {
			steps {
				git credentialsId: 'suryatinku', url: 'https://github.com/suryatinku/surya.git'
			}
		}
        stage('Build-dockerfile') { 
            steps { 
                script{
                 app = docker.build("suryatink/springboot")
                }
            }
        }
    stage('Docker deploy') {
      agent any
      steps {
          sh 'docker run -itd -p 80:8081 suryatink/springboot:latest'
        }
      }
    	
				
	}
}

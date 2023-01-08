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
        
stage('Logging into AWS ECR') {
steps {
script {
sh 'aws ecr get-login-password — region ${AWS_DEFAULT_REGION} | docker login — username AWS — password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com'
}

}
}     
        
stage('Building image') {
steps{
script {
dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}"
}
}
}        
        
stage('Push Image') {
      steps{
         script {
     sh 'docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG'
     sh 'docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}'
          }
        }
      }
    }
  
        }
    }

pipeline {
environment {
AWS_ACCOUNT_ID="098324025508"
AWS_DEFAULT_REGION="ap-south-1"
IMAGE_REPO_NAME="javademo"
IMAGE_TAG="latest"
REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
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
sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 098324025508.dkr.ecr.ap-south-1.amazonaws.com'
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

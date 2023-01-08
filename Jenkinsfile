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
                    docker.withRegistry('https://098324025508.dkr.ecr.ap-south-1.amazonaws.com', 'ecr:ap-south-1:aws') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")

          }
        }
      }
    
  
        }
    }

pipeline {
    environment {
    registry = "suryatink/cicd"
    registryCredential = 'dockerhub'
    dockerImage = ''
    }

    agent any
    stages {
            stage('Cloning our Git') {
                steps {
                git 'git@github.com:naistangz/Docker_Jenkins_Pipeline.git'
                }
            }

            stage('Building Docker Image') {
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }

            stage('Deploying Docker Image to Dockerhub') {
                steps {
                    script {
                        docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                        }
                    }
                }
            }
        }
    }

pipeline {
    agent any

    stages {
        stage('Retrieve Code') {
            steps {
                git "https://github.com/vilelalabs/simple-website.git"
            }
        }
        stage('Test with Jest') {
            steps {
                echo "Testing"
            }
        }
        stage('Build') {
            steps {
                sh "npm install"
                sh "npm run build"
            }
        }
        stage('Generate Stagging Container') {
            steps {
                 script {
                    def image = docker.build("simple-website:${env.BUILD_NUMBER}")
                    //image.push()
                   
                    sh "docker run -d -p 8081:80 simple-website:${env.BUILD_NUMBER}"
                }
            }
        }
        stage('Waits for Manual Approval') {
            steps {
                input message: 'Deploy to Production?'
            }
        }
        stage('Gera Container para Production') {
            steps {
                sh "echo 'Gera Container para Produção'"
            }
        }
    }
}
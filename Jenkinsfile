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
                    sh "contStop=$(docker ps --format '{{.ID}} ' --filter status=running)"
                    sh "docker stop $contStop"
                    sh "docker run -d -p 8081:80 simple-website:${env.BUILD_NUMBER}"
                }
            }
        }
        stage('Waits for Manual Approval') {
            steps {
                // sends slack message to manager in the channel jenkins
                input message: 'Check website in http://host:8081. \n Deploy to Production?'
            }
        }
        stage('Generate Production Container') {
            steps {
                sh "echo 'Gera Container para Produção'"
            }
        }
    }
}
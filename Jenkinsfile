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
                    
                    def docker_status = sh(script: "docker ps
                    --format '{{.ID}} ' --filter status=running", returnStdout: true)
                    
                    if((docker_status)!= ''){
                        sh "docker ps --format '{{.ID}} ' --filter status=running | xargs docker stop"
                    }
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
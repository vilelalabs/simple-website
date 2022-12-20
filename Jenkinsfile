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
        stage('Gen Stagging Container') {
            steps {
                 script {
                    def jenkinsUrl = env.JENKINS_URL
                    def baseUrl = jenkinsUrl.split(':')[0]
                    def staggingPort = 8081
                    def image = docker.build("simple-website:${env.BUILD_NUMBER}")
                    def docker_status = sh(script: "docker ps --format '{{.ID}} ' --filter status=running", returnStdout: true)
                    
                    if((docker_status)!= ''){
                        sh "docker ps --format '{{.ID}} ' --filter status=running | xargs docker stop"
                    }
                    sh "docker run -d -p ${staggingPort}:80 simple-website:${env.BUILD_NUMBER}"
                }
            }
        }
        stage('Waits for Manual Approval') {
            steps {
                // sends slack message to manager in the channel jenkins
                script {
                    def slackResponse =  slackSend (channel: '#jenkins', color: 'warning', message: "Aguardando aprovação em ${baseUrl}:${staggingPort}")
                    if (slackResponse.text == 'approve') {
                        echo 'Approved!'
                    } else {
                        echo 'Rejected!'
                    }
                }
                //input message: "Check website in http:${baseUrl}//:${staggingPort}. \n Deploy to Production?"
            }
        }
        stage('Gen Prod. Container') {
            steps {
                sh "echo 'Gera Container para Produção'"
            }
        }
    }
}
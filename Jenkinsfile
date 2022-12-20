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
                slackSend channel: '#jenkins', color: 'warning', message: "Check website in http:${baseUrl}//:${staggingPort}. \n Deploy to Production?(YES or NO)?", responseUrlVar: 'responseUrl'
                //input message: "Check website in http:${baseUrl}//:${staggingPort}. \n Deploy to Production?"
                if(responseUrl == 'YES'){
                    echo "Deploying to Production"
                } else {
                    echo "Aborting"
                    currentBuild.result = 'ABORTED'
                    error('Aborted')
                }
            }
        }
        stage('Gen Prod. Container') {
            steps {
                sh "echo 'Gera Container para Produção'"
            }
        }
    }
}
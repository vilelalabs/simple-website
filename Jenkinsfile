    // porta para saída so site em Stagging
    def staggingPort = (8081)
    // URL da máquina de processos de Desenvolvimento
    def baseUrl = ("${env.JENKINS_URL}".split(':')[1])


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
                    def image = docker.build("simple-website:${env.BUILD_NUMBER}")
                    def docker_status = sh(script: "docker ps --format '{{.ID}} ' --filter status=running", returnStdout: true)
                    
                    if((docker_status)!= ''){
                        sh "docker ps --format '{{.ID}} ' --filter status=running | xargs docker stop"
                    }
                    sh "docker run -d -p ${staggingPort}:80 simple-website:${env.BUILD_NUMBER}"
                }
            }
        }
        stage('Waits for Manual Approval'){
            steps{
                script{
                    slackSend (
                        channel: '#jenkins',
                        color: 'warning',
                        message: "Build [${env.BUILD_NUMBER}] aguardando Aprovação no Jenkins.\n\n \
                        Verifique a aplicação rodando em http:${baseUrl}:${staggingPort}/\n\n Aprove(ou não) \
                        acessando: ${env.JENKINS_URL}blue/organizations/jenkins/${JOB_NAME}/detail/${JOB_NAME}/${env.BUILD_NUMBER}/pipeline "
                        //message: "Aguardando aprovação de ${baseUrl}:${staggingPort} no Jenkins!"
                        )

                    input message: 'Deploy to Production?'
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

// Waits for Manual Approval

// def jenkinsUrl = env.JENKINS_URL
                    // def baseUrl = jenkinsUrl.split(':')[0]
                    // slackSend (channel: '#jenkins', color: 'warning', message: "Aguardando aprovação de ${baseUrl}:${staggingPort} no Jenkins!")
                    //input message: "Check website in http:${baseUrl}//:${staggingPort}. \n Deploy to Production?"
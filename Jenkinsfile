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
        stage('Gera Container para Stagging') {
            steps {
                def app = docker.build("meu-aplicativo:${env.BUILD_NUMBER}")
                sh "docker run -d -p 3000:3000 meu-aplicativo:${env.BUILD_NUMBER}"
                // app.inside {
                //     sh "npm install"
                //     sh "npm run build"
                // }
            }
        }
        stage('Gera Container para Produção') {
            steps {
                sh "echo 'Gera Container para Produção'"
            }
        }
    }
}

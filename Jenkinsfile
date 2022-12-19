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
                // script {
                //     def app = docker.build("simple-website:${env.BUILD_NUMBER}")
                //     app.inside {
                //         sh "npm install"
                //         sh "npm run build"
                //     }
                // }
                sh "docker build -t simple-website:${env.BUILD_NUMBER} ."
                sh "docker run -d -p 3000:3000 simple-website:${env.BUILD_NUMBER}"
            }
        }
        stage('Gera Container para Production') {
            steps {
                sh "echo 'Gera Container para Produção'"
            }
        }
    }
}

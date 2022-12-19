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
                 script {
                    def image = docker.build("simple-website:${env.BUILD_NUMBER}")
                    //image.push()
                    image.inside {
                        sh "docker run -d -p 3000:3000 simple-website:${env.BUILD_NUMBER}"
                    }



                }
            }
        }
        // stage('Gera Container para Production') {
        //     steps {
        //         sh "echo 'Gera Container para Produção'"
        //     }
        // }
    }
}
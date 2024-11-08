pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: 'Maven', type: 'Tool'
        SONARQUBE = 'http://18.208.133.148:9000'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh "'/bin/mvn' clean install"
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    sh "./scripts/run-sonar-scanner.sh"
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    sh 'docker-compose build'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker-compose up -d'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

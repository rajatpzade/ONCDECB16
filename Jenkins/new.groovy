pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                git 'https://github.com/rajatpzade/studentapp.ui.git'
            }
        }
        stage('Build') {
            steps {
                sh '/opt/maven/bin/mvn clean package'
            }
        }
        stage('SonarQube Analysis') {
            steps {
                    withSonarQubeEnv(credentialsId: 'sonarqube') {
                sh 'mvn clean verify sonar:sonar'
            }
            }
        }
        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
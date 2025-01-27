pipeline {
    agent any 
    stages {
        stage('Pull') { 
            steps {
                git branch: 'main', url: 'https://github.com/rajatpzade/TOMCAT.git'
            }
        }
        stage('Build') { 
            steps {
               sh 'echo Build stage successfully run'
            }
        }        
        stage('Test') { 
            steps {
                sh 'echo Test stage successfully run'
            }
        }
        stage('Deploy') { 
            steps {
                sh 'echo Deploy stage successfully run' 
            }
        }
    }
}
pipeline {
    agent any 
    stages {
        stage('Pull') { 
            steps {
                sh 'echo pull stage successfully run'
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
                // 
            }
        }
    }
}
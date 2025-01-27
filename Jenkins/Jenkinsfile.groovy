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
                // 
            }
        }        
        stage('Test') { 
            steps {
                // 
            }
        }
        stage('Deploy') { 
            steps {
                // 
            }
        }
    }
}
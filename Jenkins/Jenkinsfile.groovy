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
        stage('Test') { 
                withSonarQubeEnv(credentialsId: 'sonarqube') {
                     // some block
                 }
        stage('Deploy') { 
            steps {
                sh 'echo Deploy stage successfully run' 
            }
        }
    }
}
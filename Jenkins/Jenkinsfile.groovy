pipeline {
    agent any 

    stages {
        stage('Pull') { 
            steps {
                git url: 'https://github.com/rajatpzade/studentapp.ui.git'
            }
        }

        stage('Build') { 
            steps {
                sh '/opt/maven/bin/mvn clean package'
            }
        }        

        stage('Test') { 
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonar') {
                        sh '/opt/maven/bin/mvn clean verify sonar:sonar'
                    }
                }
            }
        }

        stage('Deploy') { 
            steps {
                sh 'echo Deploy stage successfully run' 
            }
        }
    }
}

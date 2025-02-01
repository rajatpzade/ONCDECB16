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
                    withSonarQubeEnv(credentialsId: 'sonarqube') {
                        sh '/opt/maven/bin/mvn clean verify sonar:sonar'
                    }
                }
            }
        }

        stage('Deploy') { 
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat-cred', path: '', url: 'http://3.10.24.203:8080/')], contextPath: '/', war: '**//*.war'
            }
        }
    }
}

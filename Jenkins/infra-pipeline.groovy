pipeline {
    agent any
    stages {
        stage('Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/rajatpzade/ONCDECB16.git'
            }
        }   
        stage('Test') {
            steps {
                sh '''  cd Terraform/ 
                        cd eks/ 
                        terraform init
                        terraform plan'''
            }
        }   
        stage('Deploy') {   
            steps {
                sh ''' cd eks/ 
                    terraform init
                    terraform apply --auto-approve'''
            }
        }
    }
}


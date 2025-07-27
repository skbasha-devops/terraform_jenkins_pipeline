pipeline {
    agent any
    
    stages {
        stage('Clone Repo') {
            steps {
                git(
                    url: 'https://github.com/your-username/terraform-jenkins-pipeline.git',
                    credentialsId: 'github-creds', // Match credential ID
                    branch: 'main'
                )  // <-- Missing closing parenthesis was here
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform-jenkins-pipeline') {  // <-- Added directory context
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

       

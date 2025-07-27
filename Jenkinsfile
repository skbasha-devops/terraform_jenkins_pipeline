pipeline {
    agent any
    
    stages {
        stage('Clone Repo') {
            steps {
                git(
                    url: 'https://github.com/skbasha-devops/terraform_jenkins_pipeline.git',
                    credentialsId: 'github-creds',
                    branch: 'main'
                )
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform init -input=false'
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
                    sh 'terraform plan -out=tfplan -input=false'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform apply -auto-approve -input=false tfplan'
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

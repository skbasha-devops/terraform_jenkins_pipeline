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
                sh 'ls -la'  // Verify files are present
            }
        }

        // Remove all 'dir('terraform-jenkins-pipeline')' blocks
        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan -input=false'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -input=false tfplan'
            }
        }
        
        stage('Verify Results') {
            steps {
                sh '''
                    ls -la
                    echo "File contents:"
                    cat file1.txt file2.txt || true
                    echo "Directories:"
                    ls -ld dir1 dir2 || true
                '''
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}

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
                // Debug: Show repository structure
                sh 'ls -la'
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
        
        stage('Verify Results') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    // Verify files were created
                    sh '''
                        ls -la
                        echo "File contents:"
                        cat file1.txt
                        cat file2.txt
                        echo "Directories:"
                        ls -ld dir1 dir2
                    '''
                }
            }
        }
    }
    
    post {
        success {
            echo "Pipeline completed successfully"
            // Optionally archive artifacts
            archiveArtifacts artifacts: 'terraform-jenkins-pipeline/**/*.txt', fingerprint: true
        }
        failure {
            echo "Pipeline failed - preserving workspace for debugging"
            // Don't clean workspace on failure
        }
        always {
            // Only clean if build succeeded
            script {
                if (currentBuild.result == 'SUCCESS') {
                    cleanWs()
                }
            }
        }
    }
}

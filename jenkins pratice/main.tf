pipeline {
    agent any

    parameters {
        string(name: 'TF_ACTIONS', defaultValue: '', description: 'Optional Terraform actions or targets (e.g., -target=module.vpc)')
    }

    environment {
        GIT_REPO_URL = 'https://github.com/mohdoumair/Terraform7-30am.git'
        GIT_BRANCH   = 'main'
        TF_DIR       = 'jenkins pratice'
    }

    stages {
        stage('Git Clone') {
            steps {
                git branch: "${GIT_BRANCH}", url: "${GIT_REPO_URL}"
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_DIR}") {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TF_DIR}") {
                    sh "terraform apply ${params.TF_ACTIONS} -auto-approve"
                }
            }
        }
    }
}



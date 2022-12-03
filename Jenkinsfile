pipeline {

    agent any

    tools {

        terraform 'terraform'

    }

    stages {

        stage('Terraform Init') {
            
            steps {
                sh label: '', script: 'terraform init'
            }

        }

        stage('Terraform Plan') {
            
            steps {
                sh label: '', script: 'terraform plan'
            }

        }

        stage('Terraform Apply') {
            
            steps {
                echo 'Terraform action from the parameter is --->destroy'
                sh label: '', script: 'terraform destroy --auto-approve'
                echo 'Terraform action from the parameter is --->apply'
                sh label: '', script: 'terraform apply --auto-approve'
            }

        }
    }
}
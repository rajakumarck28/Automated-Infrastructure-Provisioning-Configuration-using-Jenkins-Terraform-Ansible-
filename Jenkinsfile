pipeline {
    agent any

    environment {
        AWS_REGION = "eu-north-1"
        PEM_PATH   = "/var/lib/jenkins/docker.pem"
    }

    stages {

        stage('Clone Code') {
            steps {
                git 'https://github.com/rajakumarck28/Automated-Infrastructure-Provisioning-Configuration-using-Jenkins-Terraform-Ansible-.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'aws-creds']]) {
                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    export AWS_DEFAULT_REGION=$AWS_REGION

                    terraform apply -auto-approve
                    '''
                }
            }
        }

        stage('Get Public IP') {
            steps {
                sh 'terraform output -raw public_ip > ip.txt'
            }
        }

        stage('Create Inventory') {
            steps {
                sh '''
                IP=$(cat ip.txt)

                echo "[web]" > inventory
                echo "$IP ansible_user=ec2-user ansible_ssh_private_key_file=$PEM_PATH" >> inventory
                '''
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                sh 'ansible-playbook -i inventory playbook.yml'
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Pipeline Failed!'
        }
    }
}

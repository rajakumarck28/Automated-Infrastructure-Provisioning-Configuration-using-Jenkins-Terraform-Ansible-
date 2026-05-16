pipeline {
    agent any

    environment {
        AWS_REGION = "eu-north-1"
    }

    stages {

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                set -ex

                export AWS_DEFAULT_REGION=$AWS_REGION

                aws sts get-caller-identity

                terraform validate
                terraform plan
                terraform apply -auto-approve
                '''
            }
        }

        stage('Get Public IP') {
            steps {
                sh 'terraform output -raw instance_public_ip > ip.txt'
            }
        }

        stage('Create Inventory') {
            steps {
                sh '''
                IP=$(cat ip.txt)

                echo "[web]" > inventory
                echo "$IP" >> inventory
                '''
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                withCredentials([sshUserPrivateKey(
                    credentialsId: 'ec2-ssh-key',
                    keyFileVariable: 'SSH_KEY'
                )]) {

                    sh '''
                    export ANSIBLE_HOST_KEY_CHECKING=False

                    ansible-playbook -i inventory playbook.yml \
                    --private-key $SSH_KEY \
                    -u ec2-user
                    '''
                }
            }
        }
    }
}

🚀 Automated Infrastructure Provisioning & Configuration using Jenkins, Terraform & Ansible

📌 Project Overview

This project demonstrates an end-to-end DevOps pipeline that automates:


Infrastructure provisioning using Terraform

Configuration management using Ansible

CI/CD orchestration using Jenkins

The pipeline provisions an AWS EC2 instance and configures it with Nginx, displaying a simple web page:

👉 "Hello Ansible"

🛠️ Tech Stack

☁️ AWS (EC2, VPC, Security Groups)

🏗️ Terraform (Infrastructure as Code)

⚙️ Ansible (Configuration Management)

🔄 Jenkins (CI/CD Pipeline)


Developer → GitHub → Jenkins Pipeline → Terraform → AWS EC2
                                              ↓
                                         Ansible Playbook
                                              ↓
                                         Nginx Installed
                                              ↓
                                      Browser (Hello Ansible)


🚀 Pipeline Workflow

Code Checkout from GitHub

Terraform Init & Apply

Creates VPC, Security Group, EC2 instance

Fetch Public IP

Dynamic Inventory Creation

Run Ansible Playbook

Installs and starts Nginx

Deploys a sample webpage

🔐 Credentials Management

AWS credentials stored securely in Jenkins

SSH private key managed using Jenkins Credentials

No hardcoding of sensitive data

🌐 Output

After successful execution:

👉 Access the application in browser:

http://<EC2-Public-IP>

✅ Output:

Hello Ansible

⚠️ Prerequisites

Jenkins installed with required plugins

Terraform installed

Ansible installed

AWS account with IAM credentials

SSH key pair configured

💡 Key Features

Fully automated infrastructure provisioning

Dynamic inventory generation for Ansible

Secure credential management

CI/CD pipeline integration

Real-world DevOps workflow
🎯 Learning Outcomes

Hands-on experience with Infrastructure as Code (IaC)

CI/CD pipeline design using Jenkins

Configuration management with Ansible

AWS resource provisioning using Terraform

Secure DevOps practices

🚀 Future Enhancements

Use Terraform remote backend (S3 + DynamoDB)

Add multi-environment support (dev/prod)

Containerize application using Docker

Deploy on Kubernetes (EKS)

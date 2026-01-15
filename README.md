━━━━━━━━━━━━━━━━━━━━
README.md
━━━━━━━━━━━━━━━━━━━━

Terraform AWS 3-Tier Infrastructure

This project deploys a complete 3-tier AWS infrastructure using Terraform modules.
It provisions a production-style environment including:

VPC (public + private subnets)

Internet Gateway & routing

Security Groups (ALB + EC2)

Application Load Balancer (ALB)

Auto Scaling Group (ASG) with Launch Template

EC2 web servers with user_data

S3 bucket + DynamoDB table

CloudWatch CPU alarm

All resources are fully automated using infrastructure-as-code and a modular Terraform structure.

Architecture Overview

Tier 1 – Networking (VPC):

One VPC

Two public subnets

Two private subnets

Internet Gateway

Route tables

Tier 2 – Application Layer:

Application Load Balancer

Target Group

Listener

Auto Scaling Group

EC2 instances running Apache (installed via user_data)

Tier 3 – Data Layer:

S3 bucket

DynamoDB table

Monitoring:

CloudWatch CPU Alarm for ASG

Folder Structure
terraform-aws-3tier-infra/
provider.tf
variables.tf
outputs.tf
main.tf
modules/
    vpc/
    main.tf
    variables.tf
    outputs.tf
    security_groups/
    main.tf
    variables.tf
    outputs.tf
    alb_asg/
    main.tf
    ariables.tf
    outputs.tf
    storage/
    main.tf
    variables.tf
    outputs.tf
    monitoring/
    main.tf
    variables.tf
    outputs.tf

Prerequisites

Before running Terraform, ensure the following are installed:

Terraform >= 1.5

AWS CLI

AWS account + IAM user with programmatic access

AWS credentials configured:

aws configure

How to Deploy

Run these commands from the root folder:

Initialize Terraform
terraform init

Format Code
terraform fmt

Validate Configuration
terraform validate

Preview Infrastructure
terraform plan

Deploy Infrastructure
terraform apply


Approve with yes when prompted.

Outputs

After deployment, Terraform will show outputs such as:

VPC ID

Public Subnet IDs

ALB DNS Name

You can open the ALB DNS URL in your browser to see the running EC2 web server.

Destroy Infrastructure

When you're done:

terraform destroy


Approve with yes.

Notes

This project uses clean modular design for reusability and maintenance.

All resources follow best practices for naming and tagging.

This repo demonstrates real-world IaC skills for DevOps/Cloud roles.

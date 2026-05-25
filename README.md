# StartTech Infrastructure

This repository contains the Terraform infrastructure and deployment automation for the StartTech full-stack application.

## Infrastructure Components

- VPC with public and private subnets
- Application Load Balancer for backend traffic
- Auto Scaling Group for backend EC2 instances
- ECR repository for backend Docker images
- S3 bucket for React frontend hosting
- CloudFront distribution for frontend delivery
- ElastiCache Redis cluster
- CloudWatch log group and dashboard
- IAM role for EC2 access to CloudWatch and ECR
- GitHub Actions workflow for Terraform validation and planning

## Repository Structure

starttech-infra/
- .github/workflows/infrastructure-deploy.yml
- terraform/main.tf
- terraform/variables.tf
- terraform/outputs.tf
- terraform/modules/networking/
- terraform/modules/compute/
- terraform/modules/storage/
- terraform/modules/monitoring/
- terraform/terraform.tfvars.example
- scripts/deploy-infrastructure.sh
- monitoring/
- ARCHITECTURE.md
- RUNBOOK.md
- README.md

## Prerequisites

- AWS CLI configured
- Terraform installed
- Git installed
- Existing EC2 key pair
- MongoDB Atlas connection URI
- AWS IAM permissions for EC2, VPC, ALB, Auto Scaling, S3, CloudFront, ECR, ElastiCache, IAM, and CloudWatch

## Terraform Usage

From the terraform directory, copy the example variables file:

cp terraform.tfvars.example terraform.tfvars

Then edit terraform.tfvars with real values. Do not commit terraform.tfvars.

Validate the configuration:

terraform fmt -recursive
terraform init
terraform validate
terraform plan

Deploy manually:

terraform apply

Destroy resources:

terraform destroy

## Deployment Script

Run:

./scripts/deploy-infrastructure.sh

This script formats, initialises, validates, plans, and applies the Terraform configuration.

## GitHub Actions

The workflow in .github/workflows/infrastructure-deploy.yml runs Terraform format checks, init, validate, and plan.

Required GitHub secrets:

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

Recommended GitHub variable:

- AWS_REGION=eu-west-1

## Security Notes

- terraform.tfvars must not be committed.
- Terraform state must not be committed.
- MongoDB credentials must not be hard-coded.
- IAM permissions should follow least privilege.

## Related Application Repository

https://github.com/jaymacsberg/much-to-do/tree/feature/full-stack

# StartTech Infrastructure — AWS Terraform Deployment Automation

This repository contains the Terraform infrastructure and deployment automation for the StartTech full-stack application.

The project demonstrates hands-on work with AWS infrastructure provisioning, Terraform modules, backend deployment support, frontend hosting, monitoring resources, and CI/CD-based infrastructure validation.

This repository is presented as a cloud infrastructure and automation project, not as a live production system.

---

## Infrastructure Components

The infrastructure includes:

* VPC with public and private subnets
* Application Load Balancer for backend traffic
* Auto Scaling Group for backend EC2 instances
* Amazon ECR repository for backend Docker images
* S3 bucket for React frontend hosting
* CloudFront distribution for frontend delivery
* ElastiCache Redis cluster
* CloudWatch log group and dashboard
* IAM role for EC2 access to CloudWatch and ECR
* GitHub Actions workflow for Terraform validation and planning

---

## Technologies Used

* AWS
* Terraform
* EC2
* VPC
* Application Load Balancer
* Auto Scaling Group
* Amazon ECR
* Amazon S3
* Amazon CloudFront
* ElastiCache Redis
* CloudWatch
* IAM
* GitHub Actions
* Bash

---

## Repository Structure

```text
starttech-infra/
├── .github/workflows/
│   └── infrastructure-deploy.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars.example
│   └── modules/
│       ├── networking/
│       ├── compute/
│       ├── storage/
│       └── monitoring/
├── scripts/
│   └── deploy-infrastructure.sh
├── monitoring/
├── ARCHITECTURE.md
├── RUNBOOK.md
└── README.md
```

---

## Project Objectives

* Provision AWS infrastructure using Terraform
* Organise infrastructure code into reusable Terraform modules
* Support backend deployment using EC2, Auto Scaling, ALB, and ECR
* Support frontend delivery using S3 and CloudFront
* Add monitoring resources using CloudWatch
* Use GitHub Actions for Terraform validation and planning
* Provide architecture and runbook documentation
* Maintain safer configuration practices using example variable files and ignored local secrets

---

## Prerequisites

Before using this repository, ensure the following are available:

* AWS CLI configured locally
* Terraform installed
* Git installed
* Existing EC2 key pair
* MongoDB Atlas connection URI
* AWS IAM permissions for EC2, VPC, ALB, Auto Scaling, S3, CloudFront, ECR, ElastiCache, IAM, and CloudWatch

---

## Terraform Usage

From the `terraform/` directory, copy the example variables file:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with the required local values.

Do not commit `terraform.tfvars`.

Format the Terraform configuration:

```bash
terraform fmt -recursive
```

Initialise Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review the execution plan:

```bash
terraform plan
```

Apply the infrastructure:

```bash
terraform apply
```

Destroy the infrastructure when no longer needed:

```bash
terraform destroy
```

---

## Deployment Script

A helper script is available for local infrastructure deployment tasks:

```bash
./scripts/deploy-infrastructure.sh
```

The script runs Terraform formatting, initialisation, validation, planning, and apply steps.

Review the script before running it, especially when working with paid cloud resources.

---

## GitHub Actions

The workflow in `.github/workflows/infrastructure-deploy.yml` supports Terraform validation and planning.

Typical checks include:

* Terraform formatting
* Terraform initialisation
* Terraform validation
* Terraform plan generation

Required GitHub secrets:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

Recommended GitHub variable:

```text
AWS_REGION=eu-west-1
```

---

## Monitoring and Operations

The repository includes monitoring-related infrastructure and operational documentation through:

* CloudWatch log group configuration
* CloudWatch dashboard resources
* `ARCHITECTURE.md` for design documentation
* `RUNBOOK.md` for operational and troubleshooting guidance

---

## Security and Repository Hygiene

This repository should not contain:

* `terraform.tfvars`
* Terraform state files
* AWS access keys
* MongoDB credentials
* Private SSH keys
* `.env` files
* Hard-coded secrets

Sensitive values should be managed using local ignored files, GitHub repository secrets, AWS IAM, and secure variable handling.

IAM permissions should follow least-privilege principles.

---

## Status

Cloud infrastructure and deployment automation project.

The infrastructure may not currently be running, and any previously generated endpoints may no longer be active.

---

## Career Relevance

This project demonstrates practical skills relevant to cloud support, infrastructure support, junior cloud engineering, DevOps, and platform support roles, including:

* Terraform-based AWS provisioning
* Modular infrastructure design
* Backend infrastructure support
* Frontend hosting infrastructure
* Load balancing and autoscaling concepts
* Cloud monitoring resources
* GitHub Actions-based infrastructure validation
* Technical documentation and runbook writing

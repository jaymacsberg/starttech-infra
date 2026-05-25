#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/../terraform"

echo "Formatting Terraform files..."
terraform fmt -recursive

echo "Initialising Terraform..."
terraform init

echo "Validating Terraform configuration..."
terraform validate

echo "Creating Terraform plan..."
terraform plan -out=tfplan

echo "Applying Terraform plan..."
terraform apply tfplan

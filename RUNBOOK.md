# StartTech Runbook

## Validate Terraform

Run from the terraform directory:

terraform fmt -recursive
terraform init
terraform validate
terraform plan

## Deploy Infrastructure

Run:

terraform apply

Or from the repository root:

./scripts/deploy-infrastructure.sh

## Destroy Infrastructure

Run from the terraform directory:

terraform destroy

## Check Backend Health

Get the ALB DNS name:

terraform output alb_dns_name

Test the health endpoint:

curl -i http://ALB_DNS_NAME/health

Expected response:

{"cache":"ok","database":"ok"}

## Check Auto Scaling Group

aws autoscaling describe-auto-scaling-groups

## Check EC2 Instances

aws ec2 describe-instances --filters "Name=tag:Project,Values=starttech"

## Check Target Health

aws elbv2 describe-target-health --target-group-arn TARGET_GROUP_ARN

## Check CloudWatch Logs

Use the queries in:

monitoring/log-insights-queries.txt

## Common Issues

### Backend is unhealthy

Check EC2 state, Docker status, backend container logs, ALB target health, security group rules, MongoDB Atlas URI, and MongoDB Atlas network access.

### Frontend cannot reach backend

Check VITE_API_BASE_URL, ALB DNS name, backend CORS ALLOWED_ORIGINS, browser console errors, and ALB health checks.

### Redis connection fails

Check ElastiCache status, Redis endpoint, Redis security group, and ENABLE_CACHE=true.

## Rollback

Rollback should be done by reverting the problematic Git commit and re-running Terraform plan/apply.

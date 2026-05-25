output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.networking.private_subnet_ids
}

output "frontend_bucket_name" {
  description = "S3 bucket name for frontend hosting"
  value       = module.storage.frontend_bucket_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = module.storage.cloudfront_distribution_id
}

output "cloudfront_domain_name" {
  description = "CloudFront domain name"
  value       = module.storage.cloudfront_domain_name
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = module.compute.alb_dns_name
}

output "asg_name" {
  description = "Backend Auto Scaling Group name"
  value       = module.compute.asg_name
}

output "ecr_repository_url" {
  description = "Backend ECR repository URL"
  value       = module.compute.ecr_repository_url
}

output "redis_endpoint" {
  description = "ElastiCache Redis endpoint"
  value       = module.compute.redis_endpoint
}

output "backend_log_group_name" {
  description = "Backend CloudWatch log group name"
  value       = module.monitoring.backend_log_group_name
}

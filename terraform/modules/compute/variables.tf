variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for ALB and backend EC2 instances"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for ElastiCache Redis"
  type        = list(string)
}

variable "key_pair_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed for SSH"
  type        = string
}

variable "backend_instance_type" {
  description = "Backend EC2 instance type"
  type        = string
}

variable "backend_container_port" {
  description = "Backend container port"
  type        = number
}

variable "backend_image" {
  description = "Backend Docker image URI"
  type        = string
}

variable "asg_min_size" {
  description = "ASG minimum size"
  type        = number
}

variable "asg_desired_capacity" {
  description = "ASG desired capacity"
  type        = number
}

variable "asg_max_size" {
  description = "ASG maximum size"
  type        = number
}

variable "log_group_name" {
  description = "CloudWatch log group name"
  type        = string
}

variable "mongo_uri" {
  description = "MongoDB Atlas connection URI"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "MongoDB database name"
  type        = string
}

variable "jwt_secret_key" {
  description = "JWT secret key"
  type        = string
  sensitive   = true
}

variable "enable_cache" {
  description = "Enable Redis cache"
  type        = bool
}

variable "allowed_origins" {
  description = "Allowed CORS origins"
  type        = string
}

variable "cookie_domains" {
  description = "Allowed cookie domains"
  type        = string
}

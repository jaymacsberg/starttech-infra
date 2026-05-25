variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
  default     = "starttech"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks for Redis"
  type        = list(string)
  default     = ["10.20.3.0/24", "10.20.4.0/24"]
}

variable "key_pair_name" {
  description = "EC2 key pair name for optional SSH access"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH into backend EC2 instances"
  type        = string
}

variable "backend_instance_type" {
  description = "EC2 instance type for backend instances"
  type        = string
  default     = "t3.micro"
}

variable "asg_min_size" {
  description = "Minimum number of backend instances"
  type        = number
  default     = 1
}

variable "asg_desired_capacity" {
  description = "Desired number of backend instances"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum number of backend instances"
  type        = number
  default     = 2
}

variable "backend_container_port" {
  description = "Backend application container port"
  type        = number
  default     = 8080
}

variable "backend_image" {
  description = "Backend Docker image URI to run on EC2"
  type        = string
  default     = "public.ecr.aws/docker/library/hello-world:latest"
}

variable "mongo_uri" {
  description = "MongoDB Atlas connection URI. Use a non-production assessment database only."
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "MongoDB database name"
  type        = string
  default     = "much_todo_db"
}

variable "jwt_secret_key" {
  description = "JWT secret for backend authentication"
  type        = string
  sensitive   = true
}

variable "enable_cache" {
  description = "Enable Redis caching"
  type        = bool
  default     = true
}

variable "allowed_origins" {
  description = "Comma-separated allowed frontend origins for CORS"
  type        = string
  default     = "http://localhost:5173"
}

variable "cookie_domains" {
  description = "Comma-separated cookie domains"
  type        = string
  default     = "localhost"
}

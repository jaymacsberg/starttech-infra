# StartTech Architecture

## Overview

StartTech is a full-stack application with a React frontend, Golang backend API, Redis cache, and MongoDB database.

The infrastructure is managed with Terraform and deployed on AWS.

## Architecture Flow

User -> CloudFront -> Private S3 frontend bucket

User/API client -> Application Load Balancer -> Auto Scaling Group -> EC2 backend containers

Backend containers connect to:

- MongoDB Atlas for persistence
- ElastiCache Redis for caching
- CloudWatch Logs for centralised logging

## Frontend

The React frontend is built as static files and deployed to S3. CloudFront serves the frontend globally and provides HTTPS access.

The S3 bucket is private and accessed through CloudFront Origin Access Control.

## Backend

The backend is a Golang API packaged as a Docker image. The image is stored in ECR and run on EC2 instances.

The backend instances are managed by an Auto Scaling Group and receive traffic through an Application Load Balancer.

## Database

MongoDB is hosted externally on MongoDB Atlas. The backend receives the MongoDB URI as an environment variable.

## Redis

ElastiCache Redis provides caching and session support. Redis is placed in private subnets and only accepts traffic from the backend security group.

## Monitoring

CloudWatch provides backend logs, dashboard visibility, and operational queries.

## CI/CD

The infrastructure repository contains a GitHub Actions workflow for Terraform validation and planning.

The application repository contains workflows for frontend and backend CI/CD.

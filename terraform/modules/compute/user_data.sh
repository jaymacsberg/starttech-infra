#!/bin/bash
set -euxo pipefail

yum update -y
amazon-linux-extras install docker -y
yum install -y awslogs

systemctl enable docker
systemctl start docker

aws ecr get-login-password --region ${aws_region} | docker login --username AWS --password-stdin $(echo ${backend_image} | cut -d/ -f1)

usermod -aG docker ec2-user

cat > /etc/sysconfig/awslogs <<EOF
AWS_REGION=${aws_region}
EOF

cat > /etc/awslogs/awslogs.conf <<EOF
[general]
state_file = /var/lib/awslogs/agent-state

[/var/log/messages]
file = /var/log/messages
log_group_name = ${log_group_name}
log_stream_name = {instance_id}/messages
datetime_format = %b %d %H:%M:%S

[/var/log/starttech-backend.log]
file = /var/log/starttech-backend.log
log_group_name = ${log_group_name}
log_stream_name = {instance_id}/backend
datetime_format = %Y-%m-%dT%H:%M:%S
EOF

systemctl enable awslogsd
systemctl start awslogsd

docker run -d \
  --name starttech-backend \
  --restart unless-stopped \
  -p ${backend_port}:${backend_port} \
  -e PORT=${backend_port} \
  -e MONGO_URI='${mongo_uri}' \
  -e DB_NAME='${db_name}' \
  -e JWT_SECRET_KEY='${jwt_secret_key}' \
  -e JWT_EXPIRATION_HOURS=72 \
  -e ENABLE_CACHE='${enable_cache}' \
  -e REDIS_ADDR='${redis_endpoint}' \
  -e REDIS_PASSWORD='' \
  -e ALLOWED_ORIGINS='${allowed_origins}' \
  -e COOKIE_DOMAINS='${cookie_domains}' \
  -e SECURE_COOKIE=false \
  -e LOG_LEVEL=INFO \
  -e LOG_FORMAT=json \
  ${backend_image} >> /var/log/starttech-backend.log 2>&1

#!/bin/bash
set -e

# ============================================
# Install Docker
# ============================================
apt-get update -y
apt-get install -y ca-certificates curl gnupg

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu

# ============================================
# Pull and run the application container
# ============================================
docker pull ${dockerhub_image}:latest

docker run -d \
  --name goldenowl-app \
  --restart unless-stopped \
  -p 3000:3000 \
  ${dockerhub_image}:latest

echo "Application deployed successfully!"

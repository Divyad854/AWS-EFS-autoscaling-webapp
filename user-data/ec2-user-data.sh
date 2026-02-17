#!/bin/bash

# Install required packages
yum install -y amazon-efs-utils httpd

# Create mount directory
mkdir -p /shared

# Mount EFS
mount -t efs fs-02fb0a147de6a0300:/ /shared

# Start Apache
systemctl start httpd
systemctl enable httpd

# Create web file only if not exists
if [ ! -f /shared/index.html ]; then
  echo "Hello from EFS Shared Auto Scaling Application" > /shared/index.html
fi

# Link shared directory to web root
ln -s /shared /var/www/html

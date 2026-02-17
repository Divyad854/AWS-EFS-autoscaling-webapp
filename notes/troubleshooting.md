## Common Issues & Fixes

### Target Unhealthy
- Ensure EC2 SG allows HTTP from ALB SG
- Health check path should be /

### Load Balancer Timeout
- Target Group must be attached to Auto Scaling Group
- EC2 instances must be Healthy

### EFS Not Mounting
- EFS SG must allow NFS (2049) from EC2 SG
- EC2 and EFS must be in same VPC

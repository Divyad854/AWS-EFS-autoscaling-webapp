## Architecture Description

This architecture separates compute and storage layers.

- Compute layer uses EC2 instances in an Auto Scaling Group
- Storage layer uses Amazon EFS for shared persistent storage
- Application Load Balancer distributes traffic
- IAM Roles ensure secure access
- CloudWatch provides monitoring

This design is commonly used in enterprise web applications.

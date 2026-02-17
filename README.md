# Highly Available Auto Scaling Web Application using Amazon EFS

## 📌 Project Overview
This project demonstrates an **MNC-level AWS architecture** where multiple EC2 instances run behind an Application Load Balancer and share persistent data using **Amazon Elastic File System (EFS)**.

The solution ensures:
- High availability
- Shared file storage
- Auto scaling
- No data loss when EC2 instances are replaced

---

## 🏗 Architecture
Users access the application through an **Application Load Balancer (ALB)**.  
Traffic is routed to EC2 instances managed by an **Auto Scaling Group (ASG)**.  
All EC2 instances mount the same **Amazon EFS** file system for shared storage.

---

## 🛠 AWS Services Used
- Amazon EC2
- Amazon EFS
- Auto Scaling Group
- Application Load Balancer
- IAM Roles
- Amazon CloudWatch
- VPC & Security Groups

---

## 📂 What is Stored in EFS?
- Web application files (`index.html`)
- Shared data accessible by all EC2 instances

---

## 🚀 Key Features
- Shared storage across multiple EC2 instances
- Auto scaling without data loss
- Secure access using IAM roles
- Monitoring using CloudWatch
- Industry-standard AWS architecture

---

## 🔐 Security
- EC2 instances use IAM Role (no hardcoded credentials)
- EFS allows NFS access only from EC2 Security Group
- EC2 allows HTTP traffic only from Load Balancer Security Group

---

## 📈 Monitoring
- EC2 metrics: CPUUtilization, NetworkIn, NetworkOut
- EFS metrics: ClientConnections, DataReadIOBytes
- Auto Scaling activity tracking

---

## 🔧 Implementation Steps (Step-by-Step)

### Step 1: VPC and Networking
- Used the default VPC.
- Selected multiple subnets across different Availability Zones.
- Ensured public subnets for Load Balancer and EC2 instances.

---

### Step 2: Create IAM Role for EC2
- Created an IAM role for EC2.
- Attached the following policies:
  - `AmazonElasticFileSystemClientReadWriteAccess`
  - `CloudWatchAgentServerPolicy`
- Attached this IAM role to EC2 instances using a Launch Template.

---

### Step 3: Create Amazon EFS
- Created an Amazon EFS file system in the same VPC.
- Enabled mount targets in multiple Availability Zones.
- Configured EFS Security Group to allow **NFS (port 2049)** traffic only from the EC2 Security Group.

---

### Step 4: Configure Security Groups
- **Load Balancer Security Group**
  - Allowed inbound HTTP (port 80) from the internet (`0.0.0.0/0`)
- **EC2 Security Group**
  - Allowed inbound HTTP (port 80) only from Load Balancer Security Group
- **EFS Security Group**
  - Allowed inbound NFS (2049) only from EC2 Security Group

---

### Step 5: Create Launch Template
- Created an EC2 Launch Template using Amazon Linux 2.
- Selected Free Tier eligible instance type.
- Attached EC2 Security Group and IAM role.
- Added User Data script to install Apache, mount EFS, and serve content.

---

### Step 6: Create Target Group
- Created an Application Load Balancer target group.
- Configured health check:
  - Protocol: HTTP
  - Port: 80
  - Path: `/`
- Did not manually register instances.

---

### Step 7: Create Application Load Balancer
- Created an internet-facing Application Load Balancer.
- Attached the target group.
- Enabled traffic routing to EC2 instances.

---

### Step 8: Create Auto Scaling Group
- Created Auto Scaling Group using the Launch Template.
- Configuration:
  - Minimum instances: 2
  - Desired instances: 2
  - Maximum instances: 3
- Attached Auto Scaling Group to the target group.

---

### Step 9: Enable Monitoring
- Used Amazon CloudWatch to monitor:
  - EC2 performance metrics
  - EFS usage metrics
  - Auto Scaling activity history

---

### Step 10: Validation and Testing
- Accessed the application using Load Balancer DNS name.
- Verified that all EC2 instances displayed the same content.
- Terminated one EC2 instance.
- Auto Scaling Group launched a new instance automatically.
- Data remained available because it was stored in EFS.

---

## 🧪 Testing Summary
- Load Balancer DNS successfully served application
- EC2 replacement did not affect application data
- Shared storage worked across multiple instances

---

## 🧠 Interview Explanation (One Line)
Amazon EFS was used as shared persistent storage so that application data remains available across auto-scaled EC2 instances without data loss.

---

## ✅ Project Outcome
- Achieved high availability using Auto Scaling and Load Balancer
- Ensured data persistence using Amazon EFS
- Implemented secure, scalable, and monitored AWS architecture
- Designed solution aligned with real enterprise use cases

---

## 👤 Author
Your Name  
AWS | Cloud Computing | DevOps

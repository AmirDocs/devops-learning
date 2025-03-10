# **AMAZON CONTAINERS**

## **Container-related services on AWS**:
Amazon has a lot of services that are container related, such as Amazon ECS, Amazon EKS, AWS Fargate and Amazon ECR.

### **Amazon Elastic Container Service (ECS)**:
Amazon ECS is a fully managed container orchestration service provided by AWS that allows you to fully run containers without having to run and install orchestration software. You can define how many time run what images to use, how they should interact etc. All through simple interface.

### **Amazon Elastic Kubernetes Service (EKS)**:
EKS is Amazons fully managed Kubernetes (open source) service. It simplifies the process of running Kubernetes (an open-source container orchestration platform) on AWS without having to manage the Kubernetes control plane or the underlying infrastructure. EKS integrates with other AWS services such as IAM, Elastic Load Balancing, Auto Scaling, CloudWatch, and Amazon VPC.

#### **Amazon EKS - Node Types**:

- **Managed Node Groups** - Creates and manages Nodes for you which are part of an ASG managed by EKS. Supports On-demand or spot instances.

- **Self-Managed Nodes** - Nodes created by you and registered to the EKS cluster and managed by an ASG. You can use pre-built AMI (Amazon EKS optimized AMI). Supports On-demand or spot instances.

- **AWS Fargate** - No maintenance required: no nodes managed.

### **AWS Fargate**:
AWS Fargate is a serverless compute engine for containers offered by Amazon Web Services (AWS). It allows you to run containers without needing to provision or manage the underlying infrastructure, such as virtual machines (EC2 instances). Fargate works with both ECS and EKS.

### **EC2 Launch Types**:
- **EC2 Launch type**: When you create a ECS Cluster, you have a Launch Type. EC2 Launch Type makes you responsible for to provision and maintain the infrastructure. Each EC2 instance must run the ECS agent to register in the Cluster. Once registered, Amazon ECS takes care of starting and stopping containers. This is ideal if you want more control over your EC2 instances.

- **EC2 Fargate Launch Type**: Serverless, you do not provision the infrastructure (no EC2 instances to manage). Just create a task and define it, with past definitions. It is simple and no more EC2 instances. Ideal for workloads where you need flexibility and dont want to be bogged down managing the underlying infrastructure.

### **Amazon Elastic Container Registry (ECR)**:
Amazon ECR is a container image repository where you can store, manage and retrieve your docker images.
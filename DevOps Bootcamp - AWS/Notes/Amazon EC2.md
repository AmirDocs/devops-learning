# Amazon EC2

## **EC2 User Data**:

When launching an EC2 instance, you can provide USER DATA. A script that runs automatically when a script starts up for the first time (bootstrapping).

## **EC2 Instances Overview**:

| EC2 Instance class | Description | Use Case |
| --- | --- | --- |
| **General Purpose** | Well-rounded | Web-sever, Database and General Workflows |
| **Compute Optimized** | High processing power with extra CPU | Heavy calculations, Batch processing and High performance computing |
| **Storage Optimized** | High disk throughput and low latency | Large data sets/data bases requiring quick access to storage |
| **Accelerated Computing** | Enhanced performance by using hardware accelerators | Machine learning and Scientific simulations |
| **Memory Optimized** | Lots of memory RAM | Memory databases, Big data processing and High peformance computing workflows |
| **HPC Optimized**  | High Performance Computing, for intensive computing task that require powerful processing | scientific simulations, financial modeling, genomics |

## **Naming Convention**
A naming convention in AWS refers to a standardised way of naming AWS resources, ensuring consistency, clarity, and easier management of resources across teams and environments. An example is:

```math
m5 . 2 x Large
```
**m** = (General purpose) Instance class. C is computer optimized and r memory optimised etc.
**5** = Generation of instance (AWS improves them overtime).
**2xlarge** = Size within the instance class.

## **EC2 Sevices**:

### **EBS (Elastic Block Store) Volume**:
An Elastic Block Store Volume is a network drive you can attach to your instances while they run. It allows your instances to persist data, even after the termination of an EC2 instance and are bound to a specific availiability zone. Think of it as a network USB stick. AWS provides 30GB of free EBS storage (SSD) per month.

### **Amazon Machine Images (AMI)**:
AMI are customizations of an EC2 instance (automate set-up). It is a preconfigured template that contains all the information needed to launch and run an instance such as your own configuration, operating system, monitoring tools etc. AMI provides a faster boot time because all your software is pre-packaged. They are built for a specific region but can be copied across regions.

You can launch an EC2 instance from:
- A public AMI, pre configured and provided by AWS.
- Your own configured AMI.
- An AWS Marketplace AMI, where someone else made them, and can potentially sell them.

### **Amazon Elastic File System (EFS)**:
An EFS is Amazon's managed solution for shared file storage. EFS is a managed NFS (network file system) that can be mounted on many EC2 instances and designed to be used in multi-AZ setup. It is scalable, mutiple instances can access the same data and it grows automatically as you add more data. The downside of EFS is it can be very expensive.

## **High Availability & Scalability for EC2**:

**Vertical Scaling - Increase instance size (scale up/down)**:
Increase one instance
- From t2.nano 0.5G of RAM 1vCPU to u-12tb1.metal 12.3TB of RAM 448vCPUs.
**Horizontal Scaling - Increase number of instances (scale out/in)**:
Adding more instances to handle the load, adding multiple smaller instances with
- Auto Scaling Groups
- Load balancer
**High Availability - Run instances for the same application across multi-AZ**:
Ensures if one AZ goes down, your application remains available in that AZ. You can do this using
- Auto Scaling Group multi-AZ
- Load Balancer multi-AZ
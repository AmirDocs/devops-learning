# **INFRASTRUCTURE ORCHESTRATION VS CONFIGURATION MANAGEMENT**

## **Infrastructure Orchestration**:
Orchestration focuses on automating and managing the deployment of entire systems and workflows. It involves coordinating the interaction between various components like servers, networks, databases, and applications.

**Purpose**: The goal of orchestration is to automate the provisioning, scaling, and networking of infrastructure across different environments.

**Examples**: Kubernetes, Terraform, AWS CloudFormation.

## **Configuration Management**:
Configuration management focuses on maintaining the desired state of systems (operating systems and applications) by ensuring that configuration settings, software, and services are deployed in a consistent or specific manner(one after the other).

**Purpose**: The main goal is to manage the configuration and state of software and hardware across systems, ensuring that they are set up correctly and consistently, especially after deployment.

**Examples**: Chef, Puppet, Ansible, and SaltStack.

## **Key Differences**:

| **Aspect**                        | **Infrastructure Orchestration**                           | **Configuration Management** |
|---|---|---|
| **What it does**                  | Automates whole systems setup and manages workflows        | Ensures each part of the system is set up correctly |
| **Focus**                         | Setting up and managing servers, networks, databases, etc. | Configuring the details (software, settings) on each server |
| **Example tools**                 | Kubernetes, Terraform, AWS                                 | Puppet, Chef, Ansible |
| **When to use**                   | To automate the setup of entire infrastructure | To manage the details of the setup after it's running |

# **Terraform tips**

1. HashiCorp Terraform Documentation.

2. Test and Validate plan and it aligns with what your trying to deploy.

3. Start with a small Minimum Viable Product (MVP). Configure the resources that you need in order to deploy it to the Cloud and then iterate (impleting variables or turning your code into terraform module etc.).

4. Implement Dry Software (no repeating) engineering as there are modules and templates.
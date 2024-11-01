# **MODULES**

A good terraform module should be flexible, well documented and easy to use.

## **Why we use Modules?**:

1. **Reusability**: Modules allow you to define components once (e.g., VPCs, EC2 instances) and reuse them across projects, reducing code duplication and errors. Saves time and effort, especially in large-scale infrastructure where similar configurations need to be deployed across different environments 

2. **Organisation**: Modules break down infrastructure into logical units (e.g., network, compute), making the codebase easier to navigate and manage. You could have a network module for VPC and subnet resources, an instance module for EC2 and S3 module for buckets.

3. **Consistency**: Using the same modules across environments ensures uniform infrastructure, preventing configuration drift and simplifying troubleshooting. An example is using a module to define your security group rules, all instances of that module follow the same security practices.

4. **Collaboration**: Modules create a standardised, shareable codebase, enabling versioning and teamwork. This ensures best practices and reliability as teams contribute and maintain shared infrastructure modules.

With modules, Terraform becomes more efficient, organised, and scalable. They ensure consistent infrastructure across projects and environments, allow team members to collaborate effectively, and improve the project’s maintainability and reliability over time.

## **What makes a good module?**:

1. **Simplicity**
- Modular Design: Simplifies management by breaking infrastructure into smaller, focused components.

- Clear Structure: Makes it easier to locate and modify configurations.

2. **Documentation**
- Built-in Guidance: Includes comments and descriptions for easier understanding which can be followed by others.

- Example Usage: Provides usage examples to streamline integration.

3. **Reusability**
- Code Reuse: Enables the same module to be used across different projects and environments.

- Parameterisation: Allows customisation through input variables.

4. **Output Values**
- Expose Information: Outputs provide essential resource details (e.g., instance IDs).

- Inter-Module Communication: Facilitates seamless interaction between modules.

In summary, Terraform modules enhance simplicity, documentation, reusability, and output values, leading to better organized and manageable infrastructure code.

**Disclaimer**: Avoid hard coding values that might change between environments like instance types, regions or AMI IDs etc. instead these should be passed in as variables, allowing the module to be reused across different environments.

## **Adding modules**:

Modules are added using the main.tf file.
Create a Modules Folder. Move your ec2.tf and variables.tf files into this. Keep your provider.tf and terraform.tfvars files outside of the module folder as they are repeatable elements.
Run `terraform init` and `terraform plan`. If it says it is destroying resources, that means its no longer detecting it in our code.You will need to reference your ec2 as a module in your main.tf file.

```
module "ec2" {
    source = "path/to/module(path to ec2 on terraform)"
}
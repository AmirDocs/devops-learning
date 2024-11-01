# **VARIABLES**

Variables allow you to write cleaner more dynamic code, making it easier to manage different environments and setup. Variables allows you to put things such as the instance type or ami ID into reusable code, this makes it more **DRY** (Do not Repeat Yourself).

**Best Practice**: A seperate Variables folder where you reference it into your configuration file.

Without Specified `type =` (Type Inference) Terraform will infer that region is a string based on the provided default `type = string`.

## **Creating an Input Variable**:
Instead of having `instance_type = "t2.micro"` in your ec2.tf file. You can make this a variable. Using the variable.tf file enter:
```
variable "instance_type" {
   type = string
   default = t2.micro
}
```

To reference any variable you enter `var.` so this would be `var.instance_type`

If you run `terraform plan` without specifying (not having) `default` in your variable block. It will ask you to enter a value where you can specify on the terminal `t2.micro`.

### **Best Practice Input**:

It is best practice to pass a variable through terraform.tvfars file. You will have 2 files:
1) variables.tf
```
variable "instance_type"
  type = string
}
```
2) terraform.tfvars
```
instance_type = "t2.micro"
```
When running your code with this best practice method. You should enter `terraform apply` rather than plan.

## **Local variable**:

Local variables can centralize your values. It makes your code easier to manage and understand as you can use them repeatedly. They are internal to your terraform configuration, therefore they reduce redundecy and keep your code **DRY**. In short Local variables is referencing your code locally. 

Below is an example of referencing you Instances ami in the variables.tf file. I named the value "instance_ami" for best practice.
1) variables.tf
```
locals {
    instance_ami = "ami-03cc44329485728gg"
}
```
2) In your main or ec2.tf, enter
```
ami = local.instance_ami
```
Notice how `var.` now becomes `local.`? This is because you are referencing a local variable. After this run `terraform plan`.

## **Output variables**:

Output variables are used to display values after your entire `terraform apply` has run been completed. These can be ID's, IP addresses or other important imformation about your infrastructure. Output variables are useful for passing information to other configurations, automation tools or even just displaying them.

To define an output variable in terraform, use an output block. Inside this block scecify the name of the Output, a description (optional) and the value you want to output. To create an output block, on variables.tf reference:
```
output "instance_id"  {
    description = "The ID of the EC2 instance"
    value = aws_instance.this.id
}
```
*this* is the instance name defined in ec2.tf (main.tf). After entering the above code, run `terraform plan` then apply.

### **Best Practice Output**:

- Choose meaningful descriptive names so its clear. For the above `instance_id` is used.
- Document your outputs, always include a description for your outputs # So other people understand your code #.
- Use outputs for critical information.
- Secure sensitive Outputs such as passwords.

## **Variable Hierarchy**:
Terraform will prioritise variables from least priority to highest precedence. 
1. **Command Line Flags** - You can pass variables directly when running the terraform apply or terraform plan commands with the -var flag.

2. **TF_VAR Environment Variables** - Terraform automatically loads variables prefixed with TF_VAR from your environment, allowing you to set them globally.

3. **.tfvars Files** - This file is specified using the `-var-file` flag, typically when your running terraform apply in order to define values for multiple variables in a single place. Commonly applied when using modules.

4. **Default Values** - Defined in the variable block in your variables.tf file.

### **Putting It All Together***:
```
variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default     = "t2.micro"
}
```
Here’s how Terraform would determine which value to use:

1. **Command Line Flag** (highest precedence): `terraform apply -var="instance_type=t2.large"` in the command line.
2. **Environment Variable**: `export TF_VAR_instance_type="t2.small"` then run ``terraform apply`
3. **`.tfvars` File**: A terraform.tfvars file with
```
instance_type = "t2.medium"
region        = "us-west-2"
```
4. **Default Value**: If none of the above are provided, it defaults to `t2.micro`. Set in your variables.tf file.
```
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}
```

## **Types of Variables**:

### **Primitive Types**:

1. **String** - Usage: `${var.environment}`. *SOme text such as "Hello"
```
variable "environment" {
  type        = string
  description = "The deployment environment" #Optional#
  default     = "production"
}
```

2. **Number** - Usage: `${var.instance_count}`.
```
variable "instance_count" {
  type        = number
  description = "Number of instances to deploy"
  default     = 3
}
```

3. **Bool** - Usage: `${var.enable_monitoring}`. *True or Flase*
```
variable "enable_monitoring" {
  type        = bool
  description = "Whether to enable monitoring"
  default     = true
}
```

### **Complex Types**:

1. **List**. Usage: `${var.availability_zones[0]}` (for the first item). *Ordered sequence of values, same type*
```
variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to deploy in"
  default     = ["us-west-1a", "us-west-1b", "us-west-1c"]
}
```

2. **Map**. Usage: `${var.region_ami_map["us-west-1"]}` (to access a specific AMI ID). *A collection of key value pairs.*
```
variable "region_ami_map" {
  type        = map(string)
  description = "Mapping of AWS region to AMI ID"
  default = {
    us-west-1 = "ami-0abcd1234abcd1234"
    us-east-1 = "ami-0abcd5678abcd5678"
  }
}
```

3. **Object**. Usage: `${var.instance_config.instance_type}`. *Collection of attributes, each can have a different type*
```
variable "instance_config" {
  type = object({
    instance_type = string
    ami_id        = string
    monitoring    = bool
  })
  default = {
    instance_type = "t2.micro"
    ami_id        = "ami-0abcd1234abcd1234"
    monitoring    = true
  }
}
```
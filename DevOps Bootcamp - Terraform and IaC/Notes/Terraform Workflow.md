# **TERRAFORM WORKFLOW**

## `terraform init`

**Purpose**: Initializes the Terraform working directory.

**Explanation**: When you start a new Terraform project or work in a new directory, init is the first command to run. It downloads necessary provider plugins, sets up the backend (where Terraform stores state), and prepares the workspace. This step is critical because without it, Terraform won’t be able to execute further commands.

## `terraform validate`
**Purpose**: Checks the configuration files for syntax or logical errors.

**Explanation**: This command ensures that the configuration files are syntactically correct and follows Terraform’s structure. It doesn’t check if resources already exist but does look for potential issues in the code. Running validate is a good way to catch issues before making changes.

## `terraform plan`
**Purpose**: Creates an execution plan, showing what changes will be made to the infrastructure.

**Explanation**: plan examines the current state of your infrastructure and compares it to your configuration. It then generates a detailed report of actions that will be taken (such as resources to add, update, or delete) without actually making any changes. This is helpful for reviewing changes before they’re applied and understanding the impact on your infrastructure.

## `terraform apply`
**Purpose**: Executes the changes proposed in the plan to bring your infrastructure to the desired state.

**Explanation**: apply actually provisions, modifies, or deletes resources as specified. After reviewing the plan, apply can be run to bring your infrastructure into alignment with the code configuration. Once completed, the changes are saved to the Terraform state file.

## `terraform destroy`
**Purpose**: Removes all resources managed by the Terraform configuration.

**Explanation**: destroy is used when you need to tear down or clean up infrastructure managed by Terraform. It’s particularly useful for temporary environments, testing, or resource decommissioning. This command prompts for confirmation by default unless -auto-approve is used, as it’s a destructive action.







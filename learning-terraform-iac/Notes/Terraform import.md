# **TERRAFORM IMPORT**

`Terraform import` allows you to bring exisiting resources created manually under Terraform's management. The command allows you take resources under your cloud enviroment, such as the ones you created manually on aws (EC2 istance, S3 bucket or VPC etc.).

An **import block** (via Terraform Registry) is used to import instances using the id. Once you paste your import block onto terraform, run the command with `terraform import...` via registry.




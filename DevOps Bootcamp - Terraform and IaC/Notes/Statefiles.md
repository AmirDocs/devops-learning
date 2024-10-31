# **STATEFILES**

By storing a statefile remotely, multiple team members can access and update the same infrastructure state without risking conflicts and inconsistencies.

- **Local Statefiles**: Locally stored on your computer. Suitable for small projects and individual use.
- **Remote Statefiles**: Stores remotely such as AWS S3, Blob Storage or Terraform Cloud. Suitable for team enviroment and larger projects. 
  - Many remote backends offer state-locking to prevent users making changes at the same time which reduces the risk of state corruption. 
  - Remote backends can automatically backup your state-file and apply encryption, ensuring that your infrastructure state is both secure and recoverable.

## **Configure Backend with Statefile**:
After creating a S3 bucket on AWS. You need to add a backend block which can be found on terraform as: 

https://developer.hashicorp.com/terraform/language/backend/s3

```
  backend "s3" {
    bucket = "EnterS3BucketNameHere"
    key    = "PathToStateFileInsideBucket"
    region = "eu-west-1"
  }
```
Example:
```
  backend "s3" {
    bucket = "terraform-staet-Amir"
    key    = "terraform.tfstate"
    region = "eu-west-1"
```
Then run `terraform init`

**Best practices**: 

- Regulary backup files.
- Make sure your backend supports State-locking to prevent concurrent updates and corrupting your statefile.
- Encrypt sensitive data.
- Consider version control.


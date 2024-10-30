# **AWS**

## **AWS Console**:

AWS has Global services:
- Identity and Access Mamangement (IAM)
- Route 53 (DNS Service)
- Cloud Front (Content Delivery Network)
- WAF (Web Application Firewall)

Most AWS services are *Region-scoped*:
- Amazon EC2 (Infrastructure as a service)
- Elastic Beanstalk (Platform as a service)
- Lambda (Function as a service)
- Rekognition (Software as a service)

Region/Availability Table to check: https://aws.amazon.com/about-aws/globalinfrastructure/regional-product-services

## **Key Elements of an IAM Policy (Structure)**

An IAM Policy (Identity and Access Management Policy) is a JSON document in AWS (Amazon Web Services) that defines permissions to control who can access specific AWS resources and what actions they can perform on those resources.

structure consists of
- **Version**: Policy language version (2012-10-17 etc.)
- **ID**: an identifer for the policy (optional)
- **Statement**: one or more individual statements (required)

A **statement** consists of
- **sid**: an identifier for the statement (optional)
- **Effect**: whether the staement allows or denies access (Allow/Deny)
- **Principal**: account/user/role to which this policy applied to
- **Action**: list of actions this policy allows or denies
- **Resource**: list of resources to which the actions applied to
- **Condition: conditions for when this policy is in effect (optional)

### Use Cases of IAM Policies:
- **Least Privilege Access**: Granting users or services only the permissions they need to perform their job.
- **Service-to-Service Communication**: Allowing an AWS Lambda function to access an S3 bucket.
- **Role-based Access Control (RBAC)**: Defining different permissions for different roles, like read-only access for some users and full access for others.










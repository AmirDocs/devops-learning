# NGINX WEBSITE CHALLENGE:

Here is a step-by-step guide on how I created an NGINX website with a custom domain using Cloudflare and an AWS EC2 instance:

## **1. Bought my Domain on Cloudflare**: 
`amirbeile.co.uk`

## **2. Created an EC2 Instance Running NGINX**:
- Selected Ubuntu as my Amazon Machine Image (AMI).
- Selected t2.micro.
- Configured security groups to allow traffic on port 80 (HTTP) and SSH access with my IP Address only.

![alt text](<Screenshot 2024-10-01 030711.png>)

## **3. SSH into instance**:
- Located the private key file 'Ubuntu -1.pem' and entered `sudo chmod 400 "Ubuntu -1.pem"` to ensure key is not publicly viewable.
- SSH into instance with: `sudo ssh -i "Ubuntu -1.pem" ubuntu@ec2-35-178-249-224.eu-west-2.compute.amazonaws.com` and ran the commands:
+ `sudo apt update` 
+ `sudo apt upgrade`
+ `sudo apt install nginx -y`
+ `sudo systemctl enable nginx`

![alt text](<SSH into instance.png>)

## **4. Add an A Record in Cloudflare**:
After selecting the Domain `amirbeile.co.uk`, in the DNS settings, I created an A record that points to my EC2 instance:

**Type**: A
**Name**: nginx 
**IPv4 Address**: `35.178.249.224` (The EC2 instance)
**TTL**: Automatic
![alt text](<Cloudflare DNS.png>)
![alt text](<nginx url.png>)

## **5. Checking status of EC2 instance:
To check the status of the EC2 instance, I entered:
`sudo systemctl status nginx`
![alt text](<nginx status.png>)



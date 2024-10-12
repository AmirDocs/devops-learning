# Pushing to AWS ECR

## **What is AWS ECR?**
Amazon ECR (Elastic Container Registry) is a fully managed container registry service that allows you to store, manage, and deploy Docker container images securely. You can push, pull, store and use images in CI/CD pipelines. The management is simplified, highly reliable, scalable and cost effective. It is an integral part of AWS's DevOps ecosystem which simplifies the containerisation process.

## **Pushing my images to AWS ECR**:

**1) To install the AWS CLI, run the following commands**:

```
$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**2) After installation, generate an access key for your IAM account and log in to your AWS via terminal**.

**3) Push & Pull using these Commands**
 
 Retrieve an authentication token and authenticate your Docker client to your registry.
```
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 872515255126.dkr.ecr.eu-west-2.amazonaws.com
```

 Build your Docker image with:
 ```
 docker build -t flask-mysql .
 ```

 Tag the image to your repository:
 ```
 docker tag flask-mysql:latest 872515255126.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
 ```

And finally, run the following command to push the image to your newly created AWS repository:
```
docker push 872515255126.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```
![ECR pushing flask-mysql ](https://github.com/user-attachments/assets/af27debb-5560-431e-9b6b-ffbc8ddc0c4a)


**4) To pull your images from the ECR repository to your local docker enviroment enter:**
```
docker pull 872515255126.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

followed by:
```
docker run -p 5002:5002 872515255126.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

**5) This did not seem to work because I did not have an active version of mySQL. Create a mySQL mydb database on the custom network with**:
```
docker run -d --name mydb -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql:8
```

then run a Flask container on the custom network, mapping port 5002 and using the specified image:
```
docker run -p 5002:5002 --network my-app-network 872515255126.dkr.ecr.eu-west-2.amazonaws.com/flask-mysql:latest
```

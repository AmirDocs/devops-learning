# **LOAD BALANCERS**
A load balancer is a device or software that distributes incoming network traffic across multiple servers to ensure no single server becomes overwhelmed with too much traffic, by balancing the load.

## **Types of Load Balancers on AWS**:
AWS has 4 kinds of managed Load Balancers
- **Classic Load Balancer (CLB)** - v1 old gen 2009: HTTP, HTTPS, TCP, SSL (Secure TCP). 
- **Application Load Balancer (ALB)** - v2 new gen 2016: HTTP, HTTPS, WebSocket.
- **Network Load Balancer (NLB)** - v2 new gen 2017: TCP, TLS (Secure TCP), UDP.
- **Gateway Load Balancer (GWLB)** - 2020: Operates at Layer 3 (Network Layer) - IP Protocal.

### **Application Load Balancer (ALB)**:
An Application Load Balancer operates at layer 7 and can route tables to different target groups, these can be EC2 instances, lambda or even containers. 
Other ways you can route traffic with a ALB is:
- Routing based on path in URL. (coderco.io/users and coderco.io/posts etc.)
- Routing based on hostname in URL (routed to blog.coderco.io and news.coderco.io etc.)
- Routing based on Query String, Headers or where the device is coming from (coderco.io/users?id-456 and order=false etc.)

ALB is a great fit for microservices and container-based applications such as Docker and Amazon ECS. When running ECS, ALB has a feature called port-mapping which allows you to dynamically direct traffic to containers running on different ports.

### **Network Load Balancer (NLB)**:
Network Load Balancers are optimized for handling extreme performance and high traffic with low latency (~ 100ms). They operate at layer 4, and foward TCP and UDP traffic to your instances. It is designed for high peformance used cases, where you want to manage millions of requests per second. NLB assigns one static IP per AZ. NLB is not included in the AWS free tier.

## **Sticky Sessions (Session Affinity)**:
Sticky sessions insure that the client is always routed to the same instance and load balancer. Sticking a client to a certain server. This works for Classic Load Balancer, Application Load Balancer and Network Load Balancer. For CLB and ALB, it uses a cookie to keep track of which instance a client is connected to. Stickiness is useful for session heavy apps but it can cause imbalance in load distribution so only use it when necessary, like when usage data is not shared across multiple instances.

## **Load Balancer - SSL Certificates**:
A load balancer is the middle man to make sure traffic between instances and users are encrypted. This is done using an x.509 certificate (SSL/TLS certificate). AWS makes this easy using a service called **AWS Certificate Manager (ACM)**.

A user connects via HTTPS (encrypted), the load balancer handles that connection and once your inside your VPC your load balancer fowards the request using HTTP (over private VPC) and the request reaches the EC2 instance.

### **SSL - Server Name Indication (SNI)**:
SNI allows mulitple SSL certificates to be loaded onto the same web server (to serve multiple websites), so you odny need multiple IP addresses. This is perfect for serving multiple websites on the same box. SNI utilizes handshakes and makes sure each website gets the right SSL certificate. It only works for ALB and NLB (newer generation only) and Cloudfront.

### **Elastic Load Balancers - SSL Certificates**:
AWS has 4 kinds of managed Load Balancers
- **Classic Load Balancer (CLB) v1** - 
  + Supports only one SSL certificate.
  + Must use multiple CLB for multiple hostname with multiple SSL certificates.
  
- **Application Load Balancer (ALB) v2** - 
  + You can attach multiple SSL certificates accross multiple listeners with SNI. 
  + Different domains with different SSL certificates using the same ALB. 
  + Convenient and cost efficient.

- **Network Load Balancer (NLB) v2** - 
  + You can attach multiple SSL certificates accross multiple listeners with SNI. 
  + Different domains with different SSL certificates using the same ALB. 
  + Convenient and cost efficient.

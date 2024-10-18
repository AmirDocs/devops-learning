# **AUTOSCALING GROUP**

An autoscaling group is a feature typically used in cloud environments that automatically adjusts the number of active instances (servers, containers, or virtual machines) in a group based on real-time demand. This ensures the correct handling of various levels of traffic, while maintaining high availability and functionality.

## **Auto Scaling Group in AWS**:
An Autoscaling group operates based on 3 things. 
- Minimum Capacity: The least number of EC2 instances you always want to have running, even during low traffic times.
- Desired Capacity: Target number of instances for normal load. ASG will try to maintain this number of instances unless something changes.
- Maximum Capacity: This is the most number of instances your allowing the ASG to scale up to during high traffic periods and scale in when reduced. This avoids the need of unnecessary instances and higher costs.

## **How Auto Scaling Groups works in AWS with Load balancers**:
1) Users send traffic to a location which the Elastic Load Balancer deals with first.

2) The Elastic Load balancer has the role of distributing this traffic to the EC2 instances, spreading the load so a single EC2 instance does not get overwhelmed. ELB or ALB also continuously checks the health of the EC2 instances if one goes down or is unhealthy it stops traffic to it.

## **Auto Scaling Groups - Scaling Policies**:
When and how you control how your ASG reacts to changes in demand. There are 3 main types of **Dynamic Scaling** Policies.
1) **Target Tracking Scaling** 
   + Simple to set-up
   + Example: I want the average ASG CPU to stay at around 40%

2) **Simple/ Step Scaling**
   + When a CloudWatch alarm is triggered (example *CPU > 70%*), then adds 2 units
   + When a CloudWatch alarm is triggered (example *CPU < 30%*), then remove 1

3) **Scheduled Scaling**
   + Anticipate a scaling based on known usage patterns
   + Example: increase the min capacity to 10 at 5pm on Fridays.

## **Auto Scaling - CloudWatch Alarms & Scaling**:
Cloudwatch Alarms keep an eye on CPU usage, memory or any custom references you define. When Cloudwatch notices a spike, AWS is triggered. AWS can take action based on the scaling policies, increasing and decreasing the number of instances in yuor ASG to handle the traffic. You only pay for the resources when you need them.
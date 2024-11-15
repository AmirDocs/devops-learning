# **CICD FUNDAMENTALS**

CI/CD stands for Continuous Integration and Continuous Deployment (or Delivery).

## CI/CD Tools and Services
**CI Tools**: Jenkins, GitLab CI/CD, GitHub Actions, CircleCI, Travis CI
**Deployment Tools**: Docker, Kubernetes, Ansible, Terraform
**Testing Tools**: JUnit, Selenium, Pytest, SonarQube
**Monitoring Tools**: Prometheus, Grafana, Datadog, New Relic

## What does CICD stand for?
**Continuous Integration (CI)**: This is the practice of automating the integration of code changes from multiple contributors into a shared repository, encouraging frequent code commits to detect issues early. Each new code change triggers an automated build, and typically tests are run to catch any errors or bugs as soon as possible. Popular CI tools include *Jenkins*, *GitHub Actions*, *GitLab CI*, and *CircleCI*.

**Continuous Deployment (CD)**: This refers to automating the release of code to production once it passes all testing stages. Continuous Deployment means every change that passes the CI process automatically goes live. This level of automation is ideal for applications where small, frequent updates are common and there's a need for rapid feature releases or bug fixes.

**Continuous Delivery**: Similar to Continuous Deployment, but instead of automatically deploying code to production, the deployment is manual. It involves automated testing and deployment to a staging or testing environment, leaving a final approval step before production. Continuous Delivery is useful for companies that require more control over releases, such as organisations with rigorous compliance needs.

## **CICD Pipeline**:
CICD pipeline is a series of steps that your code changes go through from the moment they're committed (`git add` etc.) to being deployed in production.
1) **Commit change** Where you make changes and push it to github.
2) **Trigger Build** The commit you pushed is triggered and sends and automated build process.
3) **Build** Code is compiled and all dependencies are assembled and built.
4) **Notify of Build Outcome** Once the build is done, the system notifies the team whether it suceeded or failed.
5) **Run Tests** Automated tests are ran to ensure changes do not break exisiting functionality.
6) **Notify of Test Outcome** Outcome of the tests are communicated to the team.
7) **Deliver build to staging** If the test passes, the build is delivered to a staging enviroment for further testing.
8) **Deploy to Production**

## **Why CICD is important**:
- Faster delivery of new fixes and features.
- Improved quality of the software by catching and fixing bugs early.
- Reduced risk by doing smaller incremental changes to your code that are easier to test and deploy, reducing the risk of big failures.
- Better collaboration, fewer confilcts and better communication.

## **YAML (YAML Aint Markup Language)**:
YAML is a human-readable data serialisation standard that is often used for configuration files. A yaml file must end with either `.yaml` or `.yml`

1) **Key-Value Pairs**: `key: Value`

2) **List**: 
```
Lists:
- item1
- item2
- item3
```

3) **Nested elements**:
```
parent:
 child: value
```

## **Examples**

### **Key Value Pairs** examples are:
```
name: Foobar
age: 30
job: Developer
```

### **Lists** examples are:
```
fruits:
-apple
-banana
-cherry
```

### **Nested element examples** are:
```
address:
  street: 123 Downing Street
  city: London
  country: United Kingdom
```










# **DOCKER FUNDAMENTALS**

## **Introduction to containers and Docker**

### **What are containers?**
Docker containers are lightweight, portable, and isolated environments that allow developers to package applications and their dependencies together. A Docker container sits above the Docker engine, and a Docker engine sits in line with the host operating system.
Docker containers ensure that an application will run the same, regardless of where it's deployed, by encapsulating all necessary components, such as libraries, system tools, and settings—into a single container image.

### **Benefits of containers**:
- **Portability/Consistency**: Ensures consistent behavior across various environments, by encapsulating all necessary components, which can be moved to different infrastructures (MAC OS/ Windows etc.).
- **Resource Efficiency**: Lightweight and shares the host operating system kernel, leading to lower resource consumption and faster performance.
- **Isolation**: Each container runs in its own environment, preventing application conflicts and enhancing security.
- **Scalability**: Easily replicable containers allow for horizontal scaling to handle increased demand.
- **Simplified Deployment**: Integrates smoothly with CI/CD pipelines, automating build, test, and deployment processes for faster releases. Ensuring a smoother development and deployment process.
- **Enhanced collaboration**: Docker has a rich ecosystem/ active community, including Docker Hub, a cloud-based repository for sharing and storing Docker images. You can also write a Docker File and share the image for simplicity.

### **What is Docker?**
Docker is an open-source platform that enables developers to automate the deployment, scaling, and management of applications within lightweight, portable containers. These containers encapsulate all the necessary components, such as code, libraries, and dependencies that are needed to run an application consistently across different computing environments. Docker has some key component's that make it a powerful tool:
- **Docker Engine**: Core service that runs and manages containers, based on the instructions from docker file and images.
- **Docker Hub**: Repository where you can find and share container images (like the app store or google play but for Docker).
- **Docker compose**: Define and run multi-container Docker applications (writing a script on how entire Docker services are run).

### **Files, Images and Containers**:

1) **Docker File**: Creates images, includes a series of instructions/inputs from terminal to assemble an image.

2) **Docker Image** (Recipe): A Docker image/snapshot is a lightweight, standalone, executable package that includes everything needed to run a piece of software. This includes the application code, libraries, dependencies, tools, and settings. They are:
 + *read-only*, as a new image is built on top of an exisiting one. 
 + *Layered in structure*, each instruction in a Dockerfile creates a new layer.
 + *Portable*, images cna be shared accross different systems and environments.

3) **Docker Container** (Dish): Docker container is a running instance of a Docker image. It is a lightweight, standalone, and executable unit that includes everything needed to run a specific application or service and you can start, stop and modify them as needed.

### ***FAMOUS Interview Question:* VMs vs. Containers**:

| **Feature**             | **Virtual Machines (VMs)**                                  | **Containers**                           |
|---|---|---|
| **Start-up time**        | Takes minutes                        | Starts within seconds  |
| **Architecture**        | Run on a hypervisor with full OS                            | Run on a container runtime, sharing the host OS |
| **Resource Usage**      | Higher resource consumption (OS + apps)                     | Lower resource usage (app and dependencies only)|
| **Performance**         | Slower due to OS overhead                                   | Faster startup and better performance |
| **Isolation**           | Strong isolation with separate OS                           | Process level isolation, sharing the host kernel |
| **Management**          | More complex management tools                               | Easier to deploy and manage with orchestration tools |
| **Portability**         | Less portable due to size and dependencies                  | Highly portable runs on docker image format |
| **Uses**                | Suitable for legacy apps, multi-tenant environments         | Ideal for microservices, cloud-native apps |

**Hypervisor**: Manages VM's by allocating resources such as CPU, Memory and storage. Instead of a Hypervisor, Docker uses a Docker Engine.

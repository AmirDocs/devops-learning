# **DOCKER NETWORKING**
Docker networking ensures that the microservices architecture, which is different parts of an application running as independent services each in their own container, can communicate with each other efficiently and securely. Dockers networking model is highly scalable.

## **Basic Networking Concepts**: 
Docker provides several default network options you can use to manage how containers communicate.

- **Bridge Network**: Default network mode for containers on the same machine. Containers connected to the bridge network can communicate with each other using their own IP addresses and they are isolated from the host machine network. This provides an extra layer of security.

- **Host**: Uses the container's host machine network directly, without any isolation, with no distiction between the container and host. This mode is useful for applications that need to closely interact with the host system.

- **None**: This gives a container no network interface at all. This is used to ensure a container has no no network access whatsoever. This makes it completely isolated (A room with no doors or windows).


# **DOCKER COMPOSE**
Docker compose helps you run multiple Docker containers as a single service, ensuring components work together smoothly. This makes it easy to configure, start, and scale applications that consist of multiple, interconnected services (such as a web server, database, and cache).
At the heart of Docker-compose is a Docker-compose.yml file. This file lists all the services the application needs, specifying details like which image to use, which port to expose and how the containers should interact.

## **Key features of Docker Compose**:
- **Multi-Container Deployment** to define and run multiple Docker containers.
- **Declarative Configuration** with a single YAML file.
- **A Single Command to Start All Services** (`docker-compose up` etc.)
- **Scaling Services** up and down specifying how many instances should be running.
- **Networking**, Docker compose automatically creates a network for your containers to communicate with each other.

In Devops, Docker Compose makes development and testing easier, ensures consistency and enhances teamwork. Everything the team requires will be in a Docker-compose yaml and everyone will have the required enviroment set-up needed.

# **DOCKER REGISTRIES**

Docker registry is a system for storing and sharing Docker images. An online library that stores all your docker images, making them accesible whenever or wherever you need them.

## **Key features of Docker Registries**:
- **Public Registries (Docker Hub)**: Docker Hub is the default public registry provided by Docker. Anyone can access, pull or push images.

- **Private Registries**: Organisations and developers can set up private registries to store their proprietary or internal images. Allowing them to control access. Examples are AWS Elastic Container Registry (ECR), Azure Container Registry (ACR) and Google Container Registry (GCR).




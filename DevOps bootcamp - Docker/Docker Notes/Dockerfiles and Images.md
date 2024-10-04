# **DOCKERFILE AND IMAGES**

## **Structure of a Dockerfile**:

| **Command** | **Description**                                                                    |
|---|---|
| `from`      | Specifies the base image to use for the Docker image (py,node etc.)                |
| `run`       |  Executes commands in the container, used to install packages, update dependencies |
| `Copy`      | Copies files from the host machine into the container                              |
| `workdir`   | sets the working directory for subsequent instructions                             |
| `cmd`       | Specifies the command to run when the container starts                             |


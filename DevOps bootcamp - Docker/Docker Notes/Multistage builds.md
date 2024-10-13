# **MULTISTAGE BUILDS (MAKING OUR IMAGE LIGHTER)**

A Docker multi-stage build is used in Dockerfiles to create smaller, more efficient Docker images by breaking down the build process into multiple stages. This allows you to copy only the necessary components from one stage to another, which can reduce the size of the final image and optimize the build process. bekow is an example if I was to multistage my Dockerfile in my Docker-learning/helloflask repo.

# **Stage 1: Build Stage**
```
FROM python:3.8-slim as Build

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libmariadb-dev \
    pkg-config

COPY . .

RUN pip install flask mysqlclient
```

# **Stage 2: Production Stage**
```
FROM python:3.8-slim

WORKDIR /app

COPY --from=Build /app /app

EXPOSE 5002 

CMD ["python", "app.py"]
```
# Introduction to docker commands
 

# **Day 7: Docker Container Management**

---

## **1. Overview**
Docker containers are lightweight, portable, and self-sufficient units that encapsulate an application and its dependencies.

### **Key Features:**
- Portable across environments.
- Quick startup and shutdown times.
- Resource isolation with minimal overhead.

---

## **2. Essential Docker Container Commands**
Below are the essential Docker commands for container management:

| **Command**               | **Description**                                                                                  | **Example**                                     |
|---------------------------|--------------------------------------------------------------------------------------------------|------------------------------------------------|
| `docker run`              | Create and start a container.                                                                   | `docker run nginx`                             |
| `docker start`            | Start an existing container.                                                                    | `docker start <container-id>`                  |
| `docker stop`             | Stop a running container.                                                                       | `docker stop <container-id>`                   |
| `docker ps`               | List running containers.                                                                        | `docker ps`                                    |
| `docker ps -a`            | List all containers, including stopped ones.                                                    | `docker ps -a`                                 |
| `docker rm`               | Remove a container.                                                                             | `docker rm <container-id>`                     |
| `docker logs`             | Fetch the logs of a container.                                                                  | `docker logs <container-id>`                   |
| `docker stats`            | Show resource usage of running containers.                                                      | `docker stats`                                 |
| `docker exec`             | Execute a command in a running container.                                                       | `docker exec -it <container-id> bash`          |
| `docker inspect`          | Display detailed information about a container.                                                 | `docker inspect <container-id>`                |
| `docker cp`               | Copy files between a container and the host.                                                    | `docker cp <container-id>:<file-path> <host>`  |
| `docker prune`            | Remove unused containers and resources.                                                         | `docker container prune`                       |

---

## **3. Practical Examples**

### **3.1. Creating and Running Containers**
```bash
docker run -d -p 8080:80 --name web-server nginx
```
- `-d`: Run container in detached mode.
- `-p`: Map port 8080 on the host to port 80 in the container.
- `--name`: Assign a name to the container.

### **3.2. Stopping and Starting Containers**
```bash
docker stop web-server
docker start web-server
```

### **3.3. Listing Containers**
```bash
docker ps
docker ps -a
```

### **3.4. Removing Containers**
```bash
docker rm web-server
docker rm $(docker ps -aq) # Remove all containers
```

---

## **4. Interacting with Containers**

### **4.1. Execute Commands Inside a Container**
```bash
docker exec -it web-server bash
```
- Access the shell of the running container.

### **4.2. Inspect a Container**
```bash
docker inspect web-server
```
- View configuration details and metadata of the container.

### **4.3. Viewing Logs**
```bash
docker logs web-server
```

---

## **5. Expose Applications to the World**
- Use `-p` or `-P` with the `docker run` command to expose container ports to the host.

#### **Example:**
```bash
docker run -d -p 8080:80 nginx
```
- This exposes the container's port 80 to port 8080 on the host.

---

## **6. Troubleshooting Containers**

### **6.1. Monitoring Resource Usage**
```bash
docker stats
```

### **6.2. Viewing Logs**
```bash
docker logs web-server
```

### **6.3. Copying Files**
```bash
docker cp web-server:/path/in/container /path/on/host
```

---

## **7. Activities for Students**
1. **Create a Container:**
   - Run an NGINX container and access it via the browser.
2. **Interact with a Container:**
   - Execute a command inside a running container using `exec`.
3. **Inspect a Container:**
   - Use `docker inspect` to analyze metadata.
4. **Experiment with Ports:**
   - Expose different ports and test access.
5. **Monitor Resource Usage:**
   - Use `docker stats` to observe real-time resource utilization.

---

## **8. Additional Resources**
- [Docker CLI Reference](https://docs.docker.com/engine/reference/commandline/docker/)
- [Docker Container Management Guide](https://docs.docker.com/config/containers/)
- [Docker Official Documentation](https://docs.docker.com/)


# **Docker Images and Image Management**

## **Day 8: Docker Training**

---

### **1. Introduction to Docker Images**
Docker images are lightweight, standalone packages that include all necessary dependencies to run an application. 

- **Key Features:**
  - Built using layers.
  - Reusable and shareable.
  - Stored in repositories like Docker Hub or private registries.

---

### **2. Image Naming and Tagging**
- **Naming Convention:** `repository:tag` (e.g., `nginx:latest`).
- **Default Tag:** If not specified, Docker assumes `latest`.

---

### **3. Docker Repositories**
#### **Docker Hub**
- Public registry for sharing and managing images.
- [Visit Docker Hub](https://hub.docker.com/).

#### **Amazon Elastic Container Registry (ECR)**
- AWS-managed private registry for storing container images.

---

### **4. Common Docker Image Commands**
| **Command**          | **Description**                                                                                  | **Example**                                       |
|-----------------------|--------------------------------------------------------------------------------------------------|--------------------------------------------------|
| `docker pull`         | Download an image from a registry.                                                              | `docker pull nginx:latest`                       |
| `docker images`       | List all local images.                                                                          | `docker images`                                  |
| `docker rmi`          | Remove an image.                                                                                | `docker rmi nginx:latest`                        |
| `docker tag`          | Add a tag to an image.                                                                          | `docker tag nginx:latest myrepo/nginx:v1`        |
| `docker commit`       | Create a new image from a modified container.                                                   | `docker commit <container-id> myimage:v1`        |
| `docker save`         | Save an image to a tar file.                                                                    | `docker save -o nginx.tar nginx:latest`          |
| `docker load`         | Load an image from a tar file.                                                                  | `docker load -i nginx.tar`                       |
| `docker prune`        | Remove unused images.                                                                           | `docker image prune`                             |

---

### **5. Managing Docker Images**

#### **Pulling an Image**
```
docker pull ubuntu:20.04
```

### Tagging an Image

```
docker tag ubuntu:20.04 myrepo/ubuntu:v1
```
### Pushing an Image

- 1 Login to Docker Hub
  ``` 
  docker login -u rajatpzade 
  ```
- 2 Tag to Image
```
   docker tag nginx:latest rajatpzade/web- server:latest
  ```  
- 3 Push the image
  ```
  docker push rajatpzade/web-server:latest 
  ```

  ### Removing an Image
```
docker rmi image name
```
### Saving and Loading Images
```
docker save -o nginx_backup.tar nginx:latest
```
### Load an Image
```
docker load -i nginx_backup.tar
```
### Pruning Unused Images
- Remove Dangling Images
```
docker image prune
```

- Remove All Unused Images
```
docker image prune -a
```



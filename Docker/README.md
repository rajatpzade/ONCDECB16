# Introduction to docker commands
 

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




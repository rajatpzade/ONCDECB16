# Orchestration Tool: Kubernetes

## Introduction to Kubernetes
Kubernetes, often referred to as K8s, is an open-source platform designed to automate the deployment, scaling, and management of containerized applications. Initially developed by Google, Kubernetes is now maintained by the Cloud Native Computing Foundation (CNCF). It has become the industry standard for container orchestration.

## Why Do We Need an Orchestration Tool?
With the rise of containerized applications, managing containers in production environments has become increasingly complex. Challenges include:
- **Scalability**: Managing hundreds or thousands of containers.
- **Load Balancing**: Ensuring even distribution of traffic across containers.
- **High Availability**: Preventing downtime by managing container failures automatically.
- **Resource Optimization**: Efficiently utilizing system resources like CPU and memory.
- **Service Discovery**: Making it easy for containers to communicate with each other.
- **Automation**: Reducing manual intervention for repetitive tasks like deployment and scaling.

Container orchestration tools like Kubernetes address these challenges by automating the deployment, scaling, and operation of containers, making them essential in modern DevOps workflows.

## Why Kubernetes?
Kubernetes has emerged as the preferred orchestration tool for several reasons:
1. **Open Source**: Vendor-neutral and community-driven.
2. **Scalability**: Designed to handle large-scale workloads.
3. **Portability**: Works across on-premises, cloud, and hybrid environments.
4. **Extensibility**: Highly customizable through APIs and plugins.
5. **Resilience**: Automatic healing of failed containers and rescheduling.
6. **Comprehensive Ecosystem**: Supported by a wide range of tools and platforms.

## Architecture of Kubernetes
Kubernetes employs a master-worker architecture:

### 1. **Master Node**
Responsible for managing the Kubernetes cluster. Components include:
- **API Server**: Facilitates communication between users and the cluster.
- **Controller Manager**: Maintains the desired state of the cluster (e.g., ensuring the correct number of pods).
- **Scheduler**: Assigns workloads to worker nodes based on resource availability.
- **etcd**: A distributed key-value store for cluster state data.

### 2. **Worker Node**
Responsible for running application workloads. Components include:
- **Kubelet**: Communicates with the API server and manages containers.
- **Kube-proxy**: Handles networking and routing of requests to containers.
- **Container Runtime**: Runs the containers (e.g., Docker, containerd).

### 3. **Pods**
- The smallest deployable unit in Kubernetes.
- Encapsulates one or more containers, along with shared storage and network.

### 4. **Additional Components**
- **ConfigMaps and Secrets**: For managing configuration and sensitive data.
- **Ingress**: For HTTP and HTTPS routing.
- **Namespaces**: For isolating resources within a cluster.

## Lifecycle of the Pods
1. **Pending**: The pod is accepted but waiting for resource allocation.
2. **Running**: The pod has been assigned to a node, and containers are running.
3. **Succeeded**: All containers have terminated successfully.
4. **Failed**: Containers in the pod have terminated with errors.
5. **Unknown**: The pod state cannot be determined.

## Cluster Creation Methods
### 1. **Minikube**
- Ideal for local development and testing.
- Creates a single-node Kubernetes cluster on a local machine.

### 2. **Kind (Kubernetes in Docker)**
- Uses Docker containers to simulate Kubernetes clusters.
- Lightweight and ideal for CI/CD pipelines.

### 3. **Kubeadm**
- A tool for creating and configuring production-grade Kubernetes clusters.
- Requires manual setup of infrastructure and networking.

### 4. **EKS (Elastic Kubernetes Service)**
- Managed Kubernetes service by AWS.
- Simplifies cluster creation and management.

### 5. **GKE (Google Kubernetes Engine)**
- Managed Kubernetes service by Google Cloud.
- Deep integration with Google’s ecosystem.

### 6. **AKS (Azure Kubernetes Service)**
- Managed Kubernetes service by Microsoft Azure.
- Integrated with Azure’s monitoring and identity solutions.

## Conclusion
Kubernetes simplifies the management of containerized applications in complex environments. Understanding its architecture and lifecycle is fundamental for effectively deploying and managing workloads. Additionally, selecting the right cluster creation method depends on your use case, whether it’s local development or production deployment.

----

# Kubernetes: Cluster Creation and Management

## Create a Cluster Using EKS
Amazon Elastic Kubernetes Service (EKS) simplifies the process of running Kubernetes on AWS. Below is a step-by-step guide:

1. **Prerequisites**:
   - AWS CLI installed and configured with proper IAM permissions.
   - `eksctl` installed for cluster creation.
   - `kubectl` installed for managing the cluster.

2. **Cluster Creation**:
   ```bash
   eksctl create cluster \
     --name my-cluster \
     --region us-west-2 \
     --nodegroup-name my-nodes \
     --node-type t3.medium \
     --nodes 2 \
     --nodes-min 1 \
     --nodes-max 3 \
     --managed
   ```
   - `--name`: Specifies the cluster name.
   - `--node-type`: Defines the instance type for nodes.
   - `--managed`: Indicates that AWS manages the node group.

3. **Verification**:
   - Confirm the cluster is running:
     ```bash
     eksctl get cluster
     ```

---

# Create Amazon EKS Cluster Using CLI

This guide provides step-by-step instructions for setting up and managing an Amazon EKS cluster using the CLI. We will cover the installation of necessary tools and the creation of an EKS cluster.

---

## Step 1: Install `eksctl`

`eksctl` is a simple CLI tool for creating and managing Kubernetes clusters on Amazon EKS.

```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Verify installation
eksctl version
```

---

## Step 2: Install `kubectl`

`kubectl` is the Kubernetes command-line tool used to interact with Kubernetes clusters.

### Download and Verify `kubectl`

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
```

### Install `kubectl`

```bash
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Alternatively, install in local directory
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl

# Verify installation
kubectl version --client
```

---

## Step 3: Install AWS CLI

The AWS Command Line Interface (CLI) is used to manage AWS services from the command line.

### Download and Install AWS CLI

```bash
sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

### Configure AWS CLI

```bash
aws configure
```
You will be prompted to enter your AWS access key, secret key, region, and output format.

---

## Step 4: Create an EKS Cluster

Use `eksctl` to create an Amazon EKS cluster with the desired configuration.

### Create Cluster Command

```bash
eksctl create cluster \
  --name demo-ekscluster \
  --region ap-south-1 \
  --version 1.27 \
  --nodegroup-name linux-nodes \
  --node-type t2.micro \
  --nodes 2
```
- **`--name`**: Specifies the name of the cluster.
- **`--region`**: AWS region where the cluster will be created.
- **`--version`**: Kubernetes version.
- **`--nodegroup-name`**: Name of the node group.
- **`--node-type`**: Instance type for the nodes.
- **`--nodes`**: Number of nodes in the cluster.

---

## Step 5: Update `kubeconfig`

Once the cluster is created, update the `kubeconfig` file to interact with the cluster.

```bash
aws eks update-kubeconfig --name demo-ekscluster
```

---

## Step 6: Delete the EKS Cluster

If the cluster is no longer needed, it can be deleted using the following command:

```bash
eksctl delete cluster --name demo-ekscluster --region us-east-1
```

---

## Conclusion

By following the steps above, you can successfully create, manage, and delete an Amazon EKS cluster using CLI tools like `eksctl` and `kubectl`. Ensure to clean up resources when they are no longer needed to avoid unnecessary charges.


---

## Introduction to Pods and Services

### Pods
A Pod is the smallest deployable unit in Kubernetes, encapsulating one or more containers with shared resources like storage and network.

- **Lifecycle**:
  - Pending → Running → Succeeded/Failed → Terminated

- **Use Cases**:
  - Running a single application container.
  - Running multiple containers that share resources and are tightly coupled (e.g., sidecar patterns).

### Services
Services provide stable networking and expose Pods to other applications or external traffic.

- **Types of Services**:
  1. **ClusterIP**: Exposes the service within the cluster.
  2. **NodePort**: Exposes the service on each node’s IP at a static port.
  3. **LoadBalancer**: Exposes the service to the internet using a cloud provider’s load balancer.

---

## Main Container and Sidecar Containers

### Main Container
The primary container that serves the main purpose of the application. Examples include application servers or web servers.

### Sidecar Container
An auxiliary container that provides supporting functionalities, such as logging, monitoring, or proxying.

- **Examples**:
  - A logging container (e.g., Fluentd) that collects logs from the main container.
  - A proxy container (e.g., Envoy) that manages network traffic.

- **Benefits**:
  - Decouples concerns and improves maintainability.
  - Allows independent scaling and updates.

- **Implementation** (Sample Pod with a Sidecar):
  ```yaml
  apiVersion: v1
  kind: Pod
  metadata:
    name: example-pod
  spec:
    containers:
    - name: main-app
      image: nginx
    - name: sidecar-logging
      image: fluentd
  ```

---

## Run First Pod Using kubectl

1. **Create a Pod**:
   ```bash
   kubectl run nginx-pod --image=nginx --restart=Never
   ```
   - `--image`: Specifies the container image.
   - `--restart=Never`: Ensures the creation of a standalone Pod.

2. **Verify Pod**:
   ```bash
   kubectl get pods
   ```

3. **View Pod Details**:
   ```bash
   kubectl describe pod nginx-pod
   ```

---

## Expose Pod Using kubectl expose

1. **Expose Pod**:
   ```bash
   kubectl expose pod nginx-pod --type=NodePort --port=80
   ```
   - `--type=NodePort`: Exposes the Pod on a static port.
   - `--port`: Specifies the port the Pod listens on.

2. **Get Service Details**:
   ```bash
   kubectl get svc
   ```

3. **Access the Pod**:
   - Use the `<NodeIP>:<NodePort>` to access the exposed Pod.

---

## In-Depth: kubectl Usage

### Common Commands
- **View Resources**:
  ```bash
  kubectl get pods
  kubectl get svc
  kubectl get nodes
  ```

- **Apply Changes**:
  ```bash
  kubectl apply -f <manifest-file>.yaml
  ```

- **Delete Resources**:
  ```bash
  kubectl delete pod <pod-name>
  ```

- **Debugging**:
  ```bash
  kubectl logs <pod-name>
  kubectl exec -it <pod-name> -- /bin/bash
  ```

### Resource Management
- Scaling Deployments:
  ```bash
  kubectl scale deployment <deployment-name> --replicas=3
  ```

- Viewing Pod Events:
  ```bash
  kubectl describe pod <pod-name>
  ```

---

## Pod Management

### Key Operations
1. **Creating Pods**:
   Using YAML manifests to define desired state.
2. **Deleting Pods**:
   Graceful termination using `kubectl delete pod <pod-name>`.
3. **Monitoring Pods**:
   - `kubectl top pod` for resource usage.
   - `kubectl get pod -o wide` for detailed status.

---

## Conclusion
This guide provides a comprehensive understanding of EKS cluster creation, kubectl usage, and managing Pods, including advanced topics like sidecar containers. Mastery of these concepts is crucial for orchestrating containerized workloads effectively.

----

# Amazon EKS IAM Roles Guide

## Amazon EKS Cluster IAM Role

### Creating the Amazon EKS Cluster Role

#### Using the AWS Management Console

1. Open the IAM console at [IAM Console](https://console.aws.amazon.com/iam/).
2. In the left navigation pane, choose **Roles**, then select **Create role**.
3. Under **Trusted entity type**, select **AWS service**.
4. From the **Use cases for other AWS services** dropdown list, choose **EKS**.
5. Choose **EKS - Cluster** for your use case, and then select **Next**.
6. On the **Add permissions** tab, click **Next**.
7. For **Role name**, enter a unique name for your role, such as `eksClusterRole`.
8. For **Description**, enter descriptive text such as `Amazon EKS - Cluster role`.
9. Choose **Create role**.

---

## Amazon EKS Node IAM Role

### Creating the Amazon EKS Node IAM Role

#### Using the AWS Management Console

1. Open the IAM console at [IAM Console](https://console.aws.amazon.com/iam/).
2. In the left navigation pane, select **Roles**.
3. On the **Roles** page, choose **Create role**.
4. On the **Select trusted entity** page, do the following:
   - In the **Trusted entity type** section, choose **AWS service**.
   - Under **Use case**, choose **EC2**.
   - Click **Next**.
5. On the **Add permissions** page, do the following:
   - In the **Filter policies** box, enter `AmazonEKSWorkerNodePolicy`.
   - Select the checkbox to the left of **AmazonEKSWorkerNodePolicy** in the search results.
   - Choose **Clear filters**.
   - In the **Filter policies** box, enter `AmazonEC2ContainerRegistryPullOnly`.
   - Select the checkbox to the left of **AmazonEC2ContainerRegistryPullOnly** in the search results.
   - Optionally, attach either the **AmazonEKS_CNI_Policy** managed policy or an IPv6 policy you create. We recommend assigning this policy to the role associated with the Kubernetes service account instead of this role. For more information, see [Configure Amazon VPC CNI plugin to use IRSA](https://docs.aws.amazon.com/eks/latest/userguide/cni-iam-role.html).
6. Choose **Next**.
7. On the **Name, review, and create** page, do the following:
   - For **Role name**, enter a unique name for your role, such as `AmazonEKSNodeRole`.
   - For **Description**, enter descriptive text such as `Amazon EKS - Node role`.
   - Optionally, add metadata to the role by attaching tags as key-value pairs. For more information, see [Tagging IAM resources in the IAM User Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_tags.html).
8. Choose **Create role**.

---

## Amazon EKS Auto Mode Cluster IAM Role

### Overview
When using Amazon EKS in **Auto Mode**, an IAM role is required to manage your EKS cluster seamlessly. Follow these steps to create and configure this role.

#### Using the AWS Management Console

1. Navigate to the IAM console at [IAM Console](https://console.aws.amazon.com/iam/).
2. Choose **Roles**, then select **Create role**.
3. Under **Trusted entity type**, select **AWS service**.
4. From the **Use cases for other AWS services** dropdown, choose **EKS**.
5. Select **EKS - Cluster** as the use case and proceed by clicking **Next**.
6. On the **Add permissions** page, attach any additional policies needed for managing your Auto Mode cluster or click **Next** if none are required.
7. On the **Name, review, and create** page, complete the following:
   - Assign a unique name, such as `eksAutoModeClusterRole`.
   - Provide a description, such as `IAM role for managing EKS Auto Mode cluster`.
8. Click **Create role**.

---

## Additional Notes
- For both **Cluster** and **Node** roles, ensure you follow AWS best practices by assigning only the necessary permissions to reduce security risks.
- Regularly audit your IAM roles and policies to ensure compliance with your organization’s security guidelines.
- For more information, refer to the [Amazon EKS User Guide](https://docs.aws.amazon.com/eks/latest/userguide/).



---
# Orchestration Tool: Kubernetes

## Kubernetes Networking: Intra-Pod and Inter-Pod Communication

Kubernetes networking is fundamental for ensuring smooth communication between various components, including pods, services, and external clients. It provides flexible networking configurations for intra-pod and inter-pod communication.

### Intra-Pod Communication
- **Definition**: Intra-pod communication refers to the communication between containers within the same pod.
- **Mechanism**: Containers in a pod share the same network namespace, which means they:
  - Share the same IP address.
  - Can communicate directly using `localhost` and exposed container ports.

#### Example:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: multi-container-pod
spec:
  containers:
  - name: main-container
    image: nginx
    ports:
    - containerPort: 80
  - name: sidecar-container
    image: redis
    ports:
    - containerPort: 6379
```
In this example:
- The `main-container` and `sidecar-container` share the same IP address.
- The `main-container` can access Redis by connecting to `localhost:6379`.

### Inter-Pod Communication
- **Definition**: Inter-pod communication refers to the communication between pods.
- **Mechanism**:
  - Kubernetes assigns each pod a unique IP address.
  - Pods communicate directly using these IP addresses or via Kubernetes services.
  - Kubernetes ensures a flat network model where all pods can communicate without NAT.

#### Example:
- Pod A wants to access Pod B:
  - Pod A connects to Pod B's IP and exposed port directly.
  - Alternatively, Pod A connects via a Kubernetes service for Pod B.

### Kubernetes Service Types for Networking

#### 1. **ClusterIP**
- Default service type.
- Exposes the service only within the cluster.
- Example:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: clusterip-service
spec:
  selector:
    app: backend
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
```

#### 2. **NodePort**
- Exposes the service on a static port on each node.
- Example:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nodeport-service
spec:
  type: NodePort
  selector:
    app: backend
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
    nodePort: 30007
```

#### 3. **LoadBalancer**
- Exposes the service externally using a cloud provider’s load balancer.
- Example:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: loadbalancer-service
spec:
  type: LoadBalancer
  selector:
    app: backend
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
```

## Key Networking Components

### 1. Pod IP
- Each pod gets a unique IP address within the cluster.
- Enables direct communication between pods without port conflicts.

### 2. Container Port
- The port exposed by the container inside the pod.
- Used for intra-pod communication.

### 3. Node IP
- IP address of the Kubernetes node.
- Used when accessing services exposed via NodePort or LoadBalancer.

### 4. Node Port
- A static port on the node that forwards traffic to the service.
- Example: Node IP + Node Port allows access to services from outside the cluster.

### 5. LoadBalancer
- Integrates with cloud provider load balancers to expose services externally.
- Automatically assigns external IPs for access.

## Examples

### Accessing a Pod Directly
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
```
- Accessing directly via Pod IP:
  - `curl <POD_IP>:80`

### Accessing a Service via NodePort
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-nodeport-service
spec:
  type: NodePort
  selector:
    app: my-app
  ports:
  - port: 80
    targetPort: 8080
    nodePort: 30001
```
- Access:
  - `http://<NODE_IP>:30001`

### Accessing a Service via LoadBalancer
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-loadbalancer-service
spec:
  type: LoadBalancer
  selector:
    app: my-app
  ports:
  - port: 80
    targetPort: 8080
```
- Access:
  - External IP provided by the load balancer.
  - `http://<EXTERNAL_IP>:80`

----

# Introduction to YAML Scripts and Kubernetes Manifest Files

## Understanding YAML Scripts
YAML (YAML Ain't Markup Language) is a human-readable data serialization format used extensively in Kubernetes for writing manifest files. It is used to define resources like Pods, Services, Deployments, and more.

### Key Features of YAML
- **Readable**: YAML is simple and easy to understand.
- **Indentation-Based**: Proper indentation is crucial.
- **Data Types**: Supports scalars (strings, numbers), lists, and dictionaries.

### Example YAML Structure
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
  labels:
    app: my-app
spec:
  containers:
    - name: my-container
      image: nginx:latest
      ports:
        - containerPort: 80
```

## Writing Manifest Files for Pods and Services
Kubernetes uses manifest files to describe the desired state of resources in the cluster. These files are written in YAML.

### Pod Manifest File
A Pod is the smallest deployable unit in Kubernetes.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-pod
  labels:
    app: my-app
spec:
  containers:
    - name: my-container
      image: nginx:latest
      ports:
        - containerPort: 80
```
**Explanation**:
- `apiVersion`: The API version used (e.g., v1).
- `kind`: The type of resource (e.g., Pod).
- `metadata`: Metadata such as the name and labels.
- `spec`: Specification of the Pod, including containers and their properties.

### Service Manifest File
Services expose Pods to the network and enable communication between them.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: my-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP
```
**Explanation**:
- `selector`: Matches the labels of the Pods to be exposed.
- `ports`: Defines the service port and the target port on the Pod.
- `type`: Specifies the service type (e.g., ClusterIP, NodePort).

## Namespace
Namespaces provide a way to divide cluster resources between multiple users or teams.

### Default Namespaces
- **default**: The default namespace for resources without a namespace.
- **kube-system**: For Kubernetes system resources.
- **kube-public**: For publicly accessible resources.

### Creating a Namespace
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: my-namespace
```

## ReplicationController and ReplicaSet
ReplicationControllers and ReplicaSets ensure that the specified number of Pod replicas are running at all times.

### ReplicationController
```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: my-rc
spec:
  replicas: 3
  selector:
    app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: nginx:latest
```
**Explanation**:
- `replicas`: Specifies the desired number of Pods.
- `selector`: Matches labels to identify Pods.
- `template`: Describes the Pods to be created.

### ReplicaSet
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: my-rs
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: my-container
          image: nginx:latest
```
**Explanation**:
- `matchLabels`: Provides a more flexible way of selecting Pods.

### Differences Between ReplicationController and ReplicaSet
| Feature               | ReplicationController                  | ReplicaSet                          |
|-----------------------|----------------------------------------|-------------------------------------|
| **Selector**          | Uses equality-based selectors only.   | Supports set-based and equality-based selectors. |
| **Flexibility**       | Limited in matching Pods.             | More flexible in selecting Pods based on labels. |
| **Usage**             | Older method, being phased out.       | Preferred in modern deployments.   |

## Conclusion
Understanding YAML scripts and Kubernetes resources like Namespaces, ReplicationControllers, and ReplicaSets is fundamental for managing workloads effectively. ReplicaSets provide enhanced capabilities and are generally preferred for production use.

-----

# Deployments vs StatefulSets, Writing Manifests, and Understanding DaemonSets

## Introduction
In Kubernetes, different controllers manage specific workloads depending on the requirements of applications. Among the most commonly used are Deployments, StatefulSets, and DaemonSets. Each serves unique purposes in orchestrating containerized applications.

---

## Deployments vs StatefulSets

### Deployments
A **Deployment** ensures a specified number of pod replicas are running at any given time. Deployments are best suited for stateless applications.

#### Features of Deployments
- Stateless nature, meaning all pods are interchangeable.
- Easy scaling and updates with zero downtime.
- Fast rollback capability.
- Pods are recreated with new identities upon termination.

#### Use Cases
- Web servers.
- APIs.
- Microservices with no data dependency.

### StatefulSets
A **StatefulSet** is used for applications requiring unique identities and persistent storage for each pod. These are suited for stateful applications.

#### Features of StatefulSets
- Maintains a stable identity for each pod.
- Supports persistent storage using PVCs (PersistentVolumeClaims).
- Ensures ordered deployment, scaling, and deletion of pods.
- Pod names are deterministic (e.g., `pod-0`, `pod-1`).

#### Use Cases
- Databases (e.g., MySQL, MongoDB).
- Distributed systems (e.g., Kafka, ZooKeeper).
- Applications requiring strict ordering.

#### Key Differences Between Deployments and StatefulSets
| Feature                | Deployment                 | StatefulSet              |
|------------------------|----------------------------|--------------------------|
| Nature                | Stateless                 | Stateful                |
| Pod Identity          | Interchangeable           | Unique and Stable       |
| Scaling Behavior      | Independent Pods          | Ordered Scaling         |
| Storage               | Non-persistent            | Persistent Volumes      |
| Update Strategy       | Rolling Updates           | Ordered Updates         |

---

## Stateless vs Stateful Applications

### Stateless Applications
- Do not retain data between sessions.
- Pods are interchangeable and can be terminated or replaced without affecting the application.
- Example: A web server serving static pages.

### Stateful Applications
- Require data persistence and unique identities.
- Replacement pods need to access the same persistent storage and retain their identities.
- Example: A database like PostgreSQL where data must be retained even if the pod restarts.

---

## Writing Manifests

### Manifest for a Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21.6
        ports:
        - containerPort: 80
```

### Manifest for a StatefulSet
```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: web
spec:
  serviceName: "nginx"
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21.6
        ports:
        - containerPort: 80
        volumeMounts:
        - name: www
          mountPath: /usr/share/nginx/html
  volumeClaimTemplates:
  - metadata:
      name: www
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 1Gi
```

---

## Deployment Strategies

### Recreate Strategy
- Terminates all existing pods before creating new ones.
- Suitable for non-critical updates.

### Rolling Update Strategy
- Updates pods incrementally.
- Ensures minimal downtime and availability during updates.

### Canary Deployment
- Deploys a small subset of new pods alongside existing ones to test the update.

### Blue-Green Deployment
- Creates a new set of pods ("blue") while the old set ("green") remains active, enabling a smooth transition.

---

## Understanding DaemonSets

A **DaemonSet** ensures that a copy of a specific pod runs on all or selected nodes within a cluster. DaemonSets are typically used for system-level applications.

### Features of DaemonSets
- Runs one pod per node.
- Automatically schedules pods on newly added nodes.
- Ensures uninterrupted system monitoring and logging.

### Use Cases
- Log collection (e.g., Fluentd, Logstash).
- Monitoring (e.g., Prometheus Node Exporter).
- Network plugins (e.g., Calico, Weave).

### Manifest for a DaemonSet
```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: node-exporter
spec:
  selector:
    matchLabels:
      app: node-exporter
  template:
    metadata:
      labels:
        app: node-exporter
    spec:
      nodeSelector:
        kubernetes.io/hostname: node01
      containers:
      - name: node-exporter
        image: prom/node-exporter:latest
        ports:
        - containerPort: 9100

```

---

## Practical Notes for Students

### Hands-On Steps
1. **Deploying a Deployment**:
   - Apply the Deployment manifest using `kubectl apply -f <deployment-manifest.yaml>`.
   - Verify the pods using `kubectl get pods`.
   - Scale the Deployment with `kubectl scale deployment nginx-deployment --replicas=5`.

2. **Deploying a StatefulSet**:
   - Apply the StatefulSet manifest using `kubectl apply -f <statefulset-manifest.yaml>`.
   - Check pod identities using `kubectl get pods`.
   - Ensure persistent storage by observing created PVCs with `kubectl get pvc`.

3. **Deploying a DaemonSet**:
   - Apply the DaemonSet manifest using `kubectl apply -f <daemonset-manifest.yaml>`.
   - Verify one pod per node using `kubectl get pods -o wide`.

### Troubleshooting Tips
- For StatefulSets, check persistent volume status if pods fail to start.
- Ensure proper node labeling when deploying DaemonSets for specific nodes.
- Always test scaling and rolling updates to validate configurations.

---

By understanding and practicing these Kubernetes concepts, students can confidently manage real-world applications using Deployments, StatefulSets, and DaemonSets. For further clarification, explore the official Kubernetes documentation or try more complex setups.

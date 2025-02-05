# Monitoring Tool: Datadog

## Introduction to Datadog
Datadog is a cloud-based monitoring and security platform for developers, IT teams, and security engineers. It provides real-time observability into applications, infrastructure, logs, and security insights.

### Key Features:
- Infrastructure Monitoring
- Log Management
- Application Performance Monitoring (APM)
- Security Monitoring
- Real-time Dashboards

---

## Installing the Datadog Agent on Linux and Docker

### Installing Datadog Agent on Linux
1. **Sign up for Datadog**
   - Create an account on [Datadog](https://www.datadoghq.com/)
   - Retrieve your API Key from the Datadog dashboard.

2. **Install the Agent**
   ```bash
   DD_API_KEY=<YOUR_API_KEY> DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
   ```

3. **Verify Installation**
   ```bash
   sudo systemctl status datadog-agent
   ```

### Installing Datadog Agent on Docker
1. **Run the Datadog Agent as a Docker container:**
   ```bash
   docker run -d --name datadog-agent \
     -e DD_API_KEY=<YOUR_API_KEY> \
     -e DD_SITE="datadoghq.com" \
     -v /var/run/docker.sock:/var/run/docker.sock:ro \
     -v /proc/:/host/proc/:ro \
     -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
     datadog/agent:latest
   ```

2. **Check Logs**
   ```bash
   docker logs datadog-agent
   ```

---

## Introduction to the Datadog UI
The Datadog UI provides dashboards and visualizations for real-time monitoring. Key sections include:
- **Infrastructure Overview** – Displays system-wide metrics.
- **APM & Tracing** – Monitors application performance.
- **Logs** – Aggregates and analyzes logs in real-time.
- **Security** – Identifies threats and vulnerabilities.

### Navigating the UI
1. **Log in to Datadog Dashboard**
2. **Explore Metrics and Logs**
3. **Create Custom Dashboards**

---

## Introduction to Infrastructure Monitoring
Infrastructure Monitoring in Datadog helps track system performance, health, and resource usage.

### Metrics Monitored:
- **CPU Usage**
- **Memory Consumption**
- **Disk Usage**
- **Network Traffic**

### Steps to Monitor Infrastructure:
1. Install Datadog Agent on all hosts.
2. Configure tags for easy identification.
3. View real-time metrics on the **Infrastructure Dashboard**.

---

## Monitoring Hosts
Hosts refer to physical or virtual machines running in your environment. Datadog provides deep monitoring insights into each host’s performance.

### Steps to Monitor a Host:
1. Navigate to **Infrastructure > Hosts**.
2. Filter hosts based on tags, regions, or instance types.
3. Monitor CPU, RAM, and Network usage in real-time.

---

## Monitoring Docker and Kubernetes
Datadog can be used to monitor containers running in Docker or Kubernetes clusters.

### Monitoring Docker Containers
1. **Enable Docker Integration:**
   ```bash
   sudo datadog-agent integration install datadog-docker
   ```
2. **Enable container monitoring in `datadog.yaml`:**
   ```yaml
   listeners:
     - name: docker
   ```
3. **Restart the Datadog Agent:**
   ```bash
   sudo systemctl restart datadog-agent
   ```

### Monitoring Kubernetes Clusters
1. Deploy the Datadog Agent as a DaemonSet in Kubernetes:
   ```bash
   kubectl apply -f https://raw.githubusercontent.com/DataDog/datadog-agent/master/Dockerfiles/manifests/kubernetes/daemonset.yaml
   ```
2. Verify the pods are running:
   ```bash
   kubectl get pods -n datadog
   ```

---
## Difference Between Prometheus and Grafana

| Feature         | Prometheus        | Grafana            |
|----------------|------------------|--------------------|
| Purpose       | Time-series database and monitoring tool | Visualization and analytics platform |
| Data Storage  | Stores time-series data natively | Does not store data; connects to data sources |
| Query Language | PromQL (Powerful metric queries) | Uses different query languages based on data source |
| Alerting      | Built-in alert manager | Supports alerting via integrated services |
| Integration   | Native support for Kubernetes, Docker | Connects with multiple sources including Prometheus, AWS, MySQL |
| Visualization | Limited | Rich graphical dashboards |
| Use Case      | Collects and processes metrics | Displays and visualizes collected data |

**Conclusion:**
- Use **Prometheus** for data collection and storage.
- Use **Grafana** for visualization and dashboarding.
- Both tools are often used together for complete monitoring solutions.


# Jenkins Essentials 🚀

## 🌟 Introduction to CI Process

### What is Continuous Integration (CI)?
Continuous Integration is a software development practice where developers frequently integrate their code into a shared repository. Each integration is automatically verified by:

- **Automated Build Processes** 📦
- **Automated Testing** ✅

This ensures the early detection of integration issues and maintains a high-quality codebase.

### Benefits of CI
- 🕒 **Faster Feedback Loop**: Detect issues early.
- 🔒 **Improved Code Quality**: Continuous testing and validation.
- 🤝 **Collaboration**: Teams work cohesively.
- 📈 **Efficiency**: Streamlined development workflow.

---

## 🌐 Difference Between Continuous Delivery and Continuous Deployment

| Aspect                        | Continuous Delivery 🚚                             | Continuous Deployment 🚀                              |
|-------------------------------|--------------------------------------------------|--------------------------------------------------|
| **Definition**                | Ensures code is always in a deployable state.    | Automatically deploys every change to production.|
| **Deployment Trigger**        | Manual approval for production release.          | Fully automated without manual intervention.     |
| **Use Case**                  | Suitable for environments requiring compliance.  | Ideal for rapid release environments.            |
| **Automation Level**          | High, except production deployment.              | Fully automated, end-to-end.                     |

---

## 🧰 Introduction to Jenkins

### What is Jenkins?
Jenkins is an open-source automation server widely used for:
- **Building** 🛠️
- **Testing** 🧪
- **Deploying** 🚀 applications in a CI/CD pipeline.

### Why Jenkins?
- 🌍 **Extensive Community Support**: A vast plugin ecosystem.
- 🖥️ **Cross-Platform**: Runs on various OS (Windows, Linux, macOS).
- 📈 **Scalable**: From small teams to large enterprises.
- 🔌 **Integration**: Easily integrates with version control systems and build tools.

### Core Features
- 🎛️ **Pipeline as Code**: Automate your workflows using Jenkinsfile.
- ⚙️ **Plugins**: Extend functionality with 1,500+ plugins.
- 📊 **Monitoring**: Track builds and test results in real-time.
- 🛡️ **Security**: Role-based access control and integration with SSO.

---

## 🛠️ Installing Jenkins Server

### Prerequisites
1. A server with **Linux (Ubuntu/Debian)** OS. 🐧
2. **Java** installed (Jenkins requires Java 11 or later). ☕

### Steps to Install Jenkins

#### Step 1️⃣: Update Your System
```bash
sudo apt update && sudo apt upgrade -y
```

#### Step 2️⃣: Install Java
```bash
sudo apt install openjdk-11-jdk -y
```
Verify Java installation:
```bash
java -version
```

#### Step 3️⃣: Add Jenkins Repository
```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
```

#### Step 4️⃣: Install Jenkins
```bash
sudo apt update
sudo apt install jenkins -y
```

#### Step 5️⃣: Start and Enable Jenkins Service
```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

#### Step 6️⃣: Access Jenkins Web Interface
1. Open your browser and navigate to:
   ```
   http://<your-server-ip>:8080
   ```
2. Retrieve the initial admin password:
   ```bash
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```
3. Complete the setup wizard and install suggested plugins.

---

## 📖 Summary
- CI processes automate integration and testing.
- Continuous Delivery focuses on deployable code, while Continuous Deployment fully automates releases.
- Jenkins is a powerful tool for CI/CD with robust features and plugins.
- Installation involves adding repositories, installing Java, and setting up Jenkins on a Linux server.

> **Next Steps**: Explore Jenkins pipelines, create your first job, and understand plugin configurations!

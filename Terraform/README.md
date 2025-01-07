# Day 1 

# Terraform Basics - Introduction and Notes

## 1. Introduction to Infrastructure as Code (IAC)

### What is IAC?
Infrastructure as Code (IAC) is a practice of managing and provisioning infrastructure through machine-readable configuration files. It allows developers and DevOps teams to automate infrastructure tasks, ensuring consistency and reducing manual effort.

### Benefits of IAC:
- **Consistency**: Ensures consistent configurations across environments.
- **Scalability**: Simplifies scaling infrastructure up or down.
- **Efficiency**: Reduces manual effort by automating repetitive tasks.
- **Version Control**: Stores infrastructure configurations in source control systems like Git.

---

## 2. Why We Need IAC

### Difference Between Shell Script, Ansible, and IAC Tools

| **Aspect**             | **Shell Script**                 | **Ansible**                       | **IAC Tools (e.g., Terraform)**  |
|------------------------|----------------------------------|------------------------------------|-----------------------------------|
| **Purpose**           | Task automation                 | Configuration management          | Infrastructure provisioning      |
| **State Management**  | No state management             | Limited state awareness           | Tracks desired state (e.g., Terraform state) |
| **Ease of Use**       | Requires manual updates         | Declarative and user-friendly     | Declarative, focusing on desired state       |
| **Idempotence**       | Difficult to achieve            | Built-in idempotence              | Ensures state matches configuration          |
| **Tool Type**         | Scripting                       | Configuration management          | Full-stack IAC                    |

---

## 3. Introduction to Terraform

### What is Terraform?
Terraform is an open-source IAC tool developed by HashiCorp. It enables users to define and provision infrastructure using a declarative configuration language.

### Key Features:
- **Provider Support**: Works with multiple cloud providers like AWS, Azure, GCP, etc.
- **Declarative Language**: Focus on "what" to build, not "how."
- **State Management**: Maintains a state file to track infrastructure changes.
- **Plan & Apply**: Allows users to preview changes with `terraform plan` before applying them.

---

## 4. Terraform Language (Basic Syntax)

Terraform uses HashiCorp Configuration Language (HCL), which is easy to read and write. Below is an overview of its basic syntax.

### Example Terraform Configuration:
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

### Key Features of Syntax:
- **Blocks**: Enclosed in `{}` to define configurations.
- **Key-Value Pairs**: Used to specify attributes.
- **Comments**: Single-line comments with `#` or `//`.

---

## 5. Blocks Used in Terraform Language

### Common Blocks:

1. **Provider Block**:
   Specifies the cloud provider (e.g., AWS, Azure, GCP).
   ```hcl
   provider "aws" {
     region = "us-east-1"
   }
   ```

2. **Resource Block**:
   Defines infrastructure components like instances or storage.
   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-0c55b159cbfafe1f0"
     instance_type = "t2.micro"
   }
   ```

3. **Variable Block**:
   Allows parameterizing configurations.
   ```hcl
   variable "instance_type" {
     default = "t2.micro"
   }
   ```

4. **Output Block**:
   Displays results after applying configurations.
   ```hcl
   output "instance_id" {
     value = aws_instance.example.id
   }
   ```

5. **Data Block**:
   Fetches information about existing resources.
   ```hcl
   data "aws_ami" "example" {
     most_recent = true
     owners      = ["self"]
   }
   ```

---

## Notes for Students:
- Terraform is **cloud-agnostic**, making it a powerful tool for multi-cloud setups.
- Always use **version control systems** (like Git) for managing Terraform files.
- Practice writing simple configurations and gradually add complexity as you learn.
- Remember to follow best practices such as using modules and storing sensitive data in secure places (e.g., Terraform Vault).

---

### Additional Resources:
- Official Documentation: [Terraform by HashiCorp](https://www.terraform.io/)
- Hands-on Labs: [Katacoda Terraform Scenarios](https://www.katacoda.com/)
- Community Forum: [Discuss HashiCorp](https://discuss.hashicorp.com/)

-----

# Day 2

## 1. Install Terraform in a Linux System

Terraform can be installed on a Linux system using the following steps:

### Step 1: Download Terraform
```bash
wget https://releases.hashicorp.com/terraform/$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r '.current_version')/terraform_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r '.current_version')_linux_amd64.zip
```

### Step 2: Unzip the Binary
```bash
sudo apt install unzip -y
unzip terraform_*_linux_amd64.zip
```

### Step 3: Move the Binary to PATH
```bash
sudo mv terraform /usr/local/bin/
```

### Step 4: Verify Installation
```bash
terraform -v
```

---

## 2. Write Your First Terraform Script to Deploy an EC2 Instance

### Step 1: Initialize a Directory
Create a directory for your Terraform project:
```bash
mkdir terraform-ec2
cd terraform-ec2
```

### Step 2: Create a `main.tf` File
Add the following configuration to the `main.tf` file:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Example-Instance"
  }
}
```

### Step 3: Initialize Terraform
```bash
terraform init
```

### Step 4: Plan the Deployment
```bash
terraform plan
```

### Step 5: Apply the Deployment
```bash
terraform apply
```

### Step 6: Verify the EC2 Instance
Go to the AWS Management Console and verify the EC2 instance is running.

---

## 3. Explain Terraform Lifecycle

The Terraform lifecycle consists of several stages that manage the infrastructure's state effectively:

### 1. **Write**
Define infrastructure using Terraform configuration files.

### 2. **Init**
Initialize the working directory with `terraform init`. This sets up the backend and downloads provider plugins.

### 3. **Plan**
Generate an execution plan using `terraform plan` to preview the changes Terraform will make.

### 4. **Apply**
Apply the changes to achieve the desired state with `terraform apply`.

### 5. **Refresh**
Sync the Terraform state with the real-world infrastructure using `terraform refresh`.

### 6. **Destroy**
Remove all managed resources using `terraform destroy`.

---

## 4. Explain Different Files Created in Terraform Lifecycle

### 1. **main.tf**
Contains the core configuration for resources, providers, and variables.

### 2. **variables.tf**
Defines input variables to make the configuration reusable and flexible.

### 3. **outputs.tf**
Defines outputs to display information about your resources after deployment.

### 4. **terraform.tfstate**
A JSON file that stores the current state of infrastructure.

### 5. **terraform.tfstate.backup**
A backup of the previous state file.

### 6. **.terraform/**
A hidden directory containing provider plugins and other metadata.

---

## Additional Notes
- Always review the `terraform plan` output before applying changes.
- Use version control (e.g., Git) to manage your Terraform configurations.
- Secure sensitive data using Terraform variables and secret management tools.

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


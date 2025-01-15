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
## Refer Diagram:

![k8s Diagram](Images/2025-01-09%2008.48.18.gif)

---

## Additional Notes
- Always review the `terraform plan` output before applying changes.
- Use version control (e.g., Git) to manage your Terraform configurations.
- Secure sensitive data using Terraform variables and secret management tools.



# Terraform Script to Deploy Security Group with HEREDOC in UserData

This guide covers the deployment of a Security Group using Terraform and explains the HEREDOC concept in UserData along with the key blocks in the script.

---

## 1. Introduction to Security Groups
A **Security Group** acts as a virtual firewall for your instance to control inbound and outbound traffic. Terraform allows you to define and manage Security Groups using Infrastructure as Code.

---

## 2. Terraform Script for Security Group

### Script
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"
  description = "Allow inbound HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}
```

---

## 3. HEREDOC in UserData

### What is HEREDOC?
HEREDOC (**Here Document**) is a multi-line string syntax in Terraform used to define large blocks of text or commands. It is often utilized in `UserData` to pass startup scripts to cloud instances.

### Example with UserData
Below is an example of using HEREDOC within an EC2 instance resource:

```hcl
resource "aws_instance" "web_server" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /var/www/html/index.html
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
  EOF

  tags = {
    Name = "web-server"
  }
}
```

### HEREDOC Syntax
- **`<<-EOF`**: Begins the HEREDOC. The `-` allows indentation.
- **Content**: The script or text.
- **`EOF`**: Ends the HEREDOC block.

---

## 4. Key Blocks in the Terraform Script

### Provider Block
The `provider` block specifies the cloud provider to manage resources.

#### Example:
```hcl
provider "aws" {
  region = "us-east-1"
}
```
- **`region`**: Defines the AWS region for resource deployment.

### Resource Block
The `resource` block defines the actual infrastructure components.

#### Example:
```hcl
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"
  description = "Allow inbound HTTP and SSH traffic"
}
```
- **`name_prefix`**: Prefix for the Security Group name.
- **`ingress`/`egress`**: Rules for inbound and outbound traffic.

### Variable Block
The `variable` block is used to parameterize values, making the script reusable.

#### Example:
```hcl
variable "region" {
  default = "us-east-1"
}
```
- **`default`**: Specifies a default value.

### Data Block
The `data` block retrieves existing resources.

#### Example:
```hcl
data "aws_ami" "latest" {
  most_recent = true
  owners      = ["self"]
}
```
- **`most_recent`**: Fetches the latest AMI.

### Output Block
The `output` block displays resource attributes after execution.

#### Example:
```hcl
output "security_group_id" {
  value = aws_security_group.web_sg.id
}
```
- **`value`**: Specifies the attribute to output.

---

## 5. Applying the Script

### Steps:
1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Validate the script:
   ```bash
   terraform validate
   ```

3. Plan the execution:
   ```bash
   terraform plan
   ```

4. Apply the changes:
   ```bash
   terraform apply
   ```

5. Verify the Security Group in the AWS Console.

---

## 6. Conclusion
This guide demonstrated how to create a Security Group in AWS using Terraform, explained HEREDOC for `UserData`, and detailed the key blocks used in Terraform scripts. By practicing these steps, students can enhance their understanding of Terraform and Infrastructure as Code.


----------

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"
  description = "Allow inbound HTTP and SSH traffic"
  vpc_id      = "vpc-05f0e97f47f746028"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}


resource "aws_launch_template" "example" {
  name = "example-launch-template"

  image_id      = var.ami  # Replace with your appropriate AMI ID
  instance_type = var.instance_type  # Adjust instance type as needed
  # Associate the security group
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Base64 encode the user_data
  user_data = base64encode(<<-EOF
              #!/bin/bash
              # Update and install necessary packages
              yum update -y
              yum install -y httpd

              # Start and enable Apache HTTPD service
              systemctl start httpd
              systemctl enable httpd

              # Create directories for mobile app and laptop app
              mkdir -p /var/www/html/mobile-app
              mkdir -p /var/www/html/laptop-app

              # Create mobile app index.html page
              cat <<EOF1 > /var/www/html/mobile-app/index.html
              <html>
              <head><title>Mobile App</title></head>
              <body>
                <h1>Welcome to the Mobile App!</h1>
                <p>This is a simple page for the mobile app.</p>
              </body>
              </html>
              EOF1

              # Create laptop app index.html page
              cat <<EOF2 > /var/www/html/laptop-app/index.html
              <html>
              <head><title>Laptop App</title></head>
              <body>
                <h1>Welcome to the Laptop App!</h1>
                <p>This is a simple page for the laptop app.</p>
              </body>
              </html>
              EOF2

              # Set appropriate permissions for Apache to serve the apps
              chown -R apache:apache /var/www/html

              # Restart Apache HTTPD service
              systemctl restart httpd

              # Output confirmation (optional)
              echo "<h1> HOME PAGE add /mobile-app /laptop-app" > /var/www/html/index.html
              EOF
            )

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "example_asg" {
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  vpc_zone_identifier = ["subnet-00ef0be4facc89f8a", "subnet-09f2025b71397632c"]  
  min_size            = 1
  max_size            = 3
  desired_capacity    = 2

  health_check_type         = "EC2"
  health_check_grace_period = 300


}

-----

# Terraform Web Infrastructure Setup with Load Balancer and Auto Scaling

## Security Group for Web Instances (HTTP & SSH)
```hcl
resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg-"
  description = "Allow inbound HTTP and SSH traffic"
  vpc_id      = "vpc-05f0e97f47f746028"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}
```

# Launch Template for EC2 Instances
```hcl
resource "aws_launch_template" "example" {
  name = "example-launch-template"

  image_id      = var.ami  # Replace with your appropriate AMI ID
  instance_type = var.instance_type  # Adjust instance type as needed
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              mkdir -p /var/www/html/mobile-app
              mkdir -p /var/www/html/laptop-app

              cat <<EOF1 > /var/www/html/mobile-app/index.html
              <html>
              <head><title>Mobile App</title></head>
              <body>
                <h1>Welcome to the Mobile App!</h1>
                <p>This is a simple page for the mobile app.</p>
              </body>
              </html>
              EOF1

              cat <<EOF2 > /var/www/html/laptop-app/index.html
              <html>
              <head><title>Laptop App</title></head>
              <body>
                <h1>Welcome to the Laptop App!</h1>
                <p>This is a simple page for the laptop app.</p>
              </body>
              </html>
              EOF2

              chown -R apache:apache /var/www/html
              systemctl restart httpd

              echo "<h1>HOME PAGE add /mobile-app /laptop-app" > /var/www/html/index.html
              EOF
            )

  lifecycle {
    create_before_destroy = true
  }
}
```

# Auto Scaling Group with Target Groups
```hcl
resource "aws_autoscaling_group" "example_asg" {
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  vpc_zone_identifier = ["subnet-00ef0be4facc89f8a", "subnet-09f2025b71397632c"]
  min_size            = 1
  max_size            = 3
  desired_capacity    = 2

  health_check_type         = "EC2"
  health_check_grace_period = 300

  target_group_arns = [
    aws_lb_target_group.lb_tg_home.arn,  # Home target group
    aws_lb_target_group.lb_tg_laptop.arn # Laptop target group
  ]

  tag {
    key                 = "Name"
    value               = "example-asg"
    propagate_at_launch = true
  }
}
```

# Target Group for Home Page
```hcl
resource "aws_lb_target_group" "lb_tg_home" {
  name     = "lb-tg-home"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-05f0e97f47f746028"

  health_check {
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
```

# Target Group for Laptop App
```hcl
resource "aws_lb_target_group" "lb_tg_laptop" {
  name     = "lb-tg-laptop"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-05f0e97f47f746028"

  health_check {
    path                = "/laptop/"
    port                = 80
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
```

# Application Load Balancer Setup
```hcl
resource "aws_lb" "my_lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = ["subnet-00ef0be4facc89f8a", "subnet-09f2025b71397632c"]

  tags = {
    app = "my-lb"
  }
}
```

# Load Balancer Listener Setup
```hcl
resource "aws_lb_listener" "my_lb_listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg_home.arn
  }
}
```

# Load Balancer Listener Rule for Laptop App Routing
```hcl
resource "aws_lb_listener_rule" "my_lb_listener_rule" {
  listener_arn = aws_lb_listener.my_lb_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg_laptop.arn
  }

  condition {
    path_pattern {
      values = ["/laptop/*"]
    }
  }
}



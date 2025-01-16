# vpc Creation 

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

# subnet creation

resource "aws_subnet" "Public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/20"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-2c"

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "Private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "private"
  }
}

# create igw 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

# route table 

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

   tags = {
    Name = "main-RT"
  }
}

# Resource: aws_route_table_association

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Public.id
  route_table_id = aws_route_table.example.id
}

# key-Pair 

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key
}

# security group

resource "aws_security_group" "allow_tls" {
  name        = "my-security_grpup"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
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
    Name = "my-security_group"
  }
}



resource "aws_instance" "web" {
  ami           = "ami-0a89c0e1fe86ef74e"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.deployer.id

    user_data = <<-EOF
    #!/bin/bash
    yum install -y httpd
    echo "Hello, World!" > /var/www/html/index.html
    systemctl start httpd
    systemctl enable httpd
  EOF

  tags = {
    Name = "web"
  }
}




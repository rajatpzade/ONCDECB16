provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

resource "aws_instance" "web" {
  ami           = "ami-0b2cd2a95639e0e5b"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform"
  }
}
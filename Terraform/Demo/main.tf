resource "aws_instance" "web" {
  ami           = "ami-0b2cd2a95639e0e5b"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
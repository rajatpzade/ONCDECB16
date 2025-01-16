
# # Data source to get the default VPC
# data "aws_vpc" "default" {
#   default = true
# }

# # Data source to get subnets associated with the default VPC
# data "aws_subnets" "default" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default.id]
#   }
# }

# # Launch an EC2 instance in the default VPC and a subnet
# resource "aws_instance" "example" {
#   ami           = "ami-0a89c0e1fe86ef74e" # Replace with your desired AMI
#   instance_type = "t2.micro"
#   # Use the first subnet in the list of default VPC subnets
#   subnet_id = data.aws_subnets.default.ids[0]
#   key_name = aws_key_pair.deployer.id
#   vpc_security_group_ids = [aws_default_security_group.default.id]

#   # Add a simple tag for identification
#   tags = {
#     Name = "ExampleInstance"
#   }
# }

# resource "aws_key_pair" "deployer" {
#   key_name   = var.key_name
#   public_key = var.public_key
# }


# resource "aws_default_security_group" "default" {
#   vpc_id = data.aws_vpc.default.id

#   ingress {
#     description = "TLS from VPC"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "TLS from VPC"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }
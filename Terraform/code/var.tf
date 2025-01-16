variable "region" {
  default = "eu-west-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable ami {
  default = "ami-0a89c0e1fe86ef74e"
}

variable "key_name" {
  default = "id_rsa"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCiKPyZOA9EW/sN83/4j/An9n100arHZjfS4YdquKIK8TIzWkcxk3UaFDYbMdsrIWNFmkMqUB+KaIXmoR48iAWU29OHQa9crr5EzHBZq3P380Jm0WcjdAvWnKVPgmxwvjgMIPAp6NyeOhwaeKUnmUodweQjmNAoFK8HE7HvcfPqfzdbirhVOGeufwwVG2puniHjUYRsfjWYwAcLifMPtbu4d2eyH7i1vVL3TXXDHHmWJtR7qzNVLIede3621s380IjbR7NJ2FPR+CGH1UidmfFZ+ZzfXRjnhrbM/7NOXC+GcRnRTUKPHENyN7AraOXPT+iN3S/e2sD9M4xPIIJG1u6MpS41Jae+lvlZ29FDZ49izhX8aIug0OCLDgv4yRm+5FZBpMm4ipEfnizP5Nxy7yeqhTrcQDyCGZtsf6YGWwVTgorADdoj/h4ROcYeld3MiXnqsJS132dWeGFe12wYe1ynBIHQLmTg9o2qFy73kqBd2rxP5yPQTBLTrnWDCWOOHuE= rajatzade@Rajats-MacBook-Air.local"
}

variable "access_key" {
  default = "AKIAWOOXUHE2FB57VRGQ"
}

variable "secret_key" {
  default = "id_rsa"
}

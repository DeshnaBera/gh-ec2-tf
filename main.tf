provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "mytf-state-file"
    key    = "path/to/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ec2" {
  ami = "ami-0fa1ca9559f1892ec"
  instance_type = "t2.micro"

  tags = {
    Name = "test-instance"
  }
}
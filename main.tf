provider "aws" {
  region = "us-east-1"
}

variable "environment" {
 description = "The environment for the infrastructure"
 type        = string
}

terraform{
    backend "s3"{
bucket         = "mytf-state-file-${var.environment}"
key            = "path/to/terraform-${var.environment}.tfstate"
region         = "us-east-1"
encrypt        = true
dynamodb_table = "TfStateLock-${var.environment}"
    }
}

resource "aws_instance" "ec2" {
  ami = "ami-0fa1ca9559f1892ec"
  instance_type = "t2.micro"

  tags = {
   Name = "example-instance-${var.environment}"
   Environment = var.environment
 }
}
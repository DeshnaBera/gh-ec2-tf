terraform{
    backend "s3"{
bucket         = "mytf-state-file-${var.environment}"
key            = "path/to/terraform-${var.environment}.tfstate"
region         = "us-east-1"
encrypt        = true
dynamodb_table = "TfStateLock-${var.environment}"
    }
}
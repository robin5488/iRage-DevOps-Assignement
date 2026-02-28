terraform {
  backend "s3" {
    bucket = "irage-terraform-bucket-123456789"
    key = "production/terraform.tfstate"
    region = "eu-north-1"
    dynamodb_table = "terraform-state-locks"
    encrypt = true
  }
}
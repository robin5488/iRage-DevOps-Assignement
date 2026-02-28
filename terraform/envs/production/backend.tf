terraform {
  backend "s3" {
    bucket = "irage-terraform-bucket"
    key = "production/terraform.tfstate"
    region = var.aws_region
    dynamodb_table = "terraform-state-locks"
    encrypt = true
  }
}
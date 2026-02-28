variable "env" {
  description = "Environment name (staging or production)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_id" {
  description = "Private subnet ID for RDS"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security Group ID of bastion host"
  type        = string
}

variable "db_engine_version" {
  description = "MySQL engine version"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "rds_secret_name" {
  description = "AWS Secrets Manager secret name containing RDS credentials (username and password)"
  type        = string
  default     = null

  validation {
    condition     = var.rds_secret_name == null || can(regex("^[a-zA-Z0-9/_-]+$", var.rds_secret_name))
    error_message = "Secret name must be a valid AWS Secrets Manager secret name."
  }
}

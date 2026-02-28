variable "aws_region" {
  description = "AWS region"
  type        = string
  default = "us-east-1"
}

variable "env" {
  description = "Environment name (staging or production)"
  type        = string
}

#-------------------network variables-------------------

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

##-------------------bastion-ec2 variables-------------------

variable "bastion_instance_type" {
  description = "EC2 instance type for bastion"
  type        = string
  default     = "t3.micro"
}

variable "bastion_ami_id" {
  description = "AMI ID for bastion host"
  type        = string
}

variable "my_ip" {
  description = "Your public IP for SSH access (x.x.x.x)"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "bastion_sg_id" {
  description = "Security Group ID of bastion host"
  type        = string
}

#-------------------mysql-db variables-------------------

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

variable "db_username" {
  description = "Master username"
  type        = string
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}
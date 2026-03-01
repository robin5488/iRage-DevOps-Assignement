variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "env" {
  description = "Environment name"
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

variable "private_subnet_cidrs" {
  description = "CIDR block for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
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
  description = "List of public IPs allowed for SSH access to bastion (e.g., ['192.168.1.37/32', '10.0.0.5/32'])"
  type        = list(string)
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

#-------------------mysql-db variables-------------------

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

# RDS credentials are now managed at the module level via AWS Secrets Manager
# Naming convention: {environment}/rds/secret (e.g., staging/rds/secret, production/rds/secret)

variable "env" {
  description = "Environment name (staging or production)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where bastion will be created"
  type        = string
}

variable "public_subnet_id" {
  description = "Public subnet ID for bastion host"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for bastion"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
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
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
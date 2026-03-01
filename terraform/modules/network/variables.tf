variable "env" {
  description = "Environment name (staging or production)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR block for private subnet"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability Zones"
  type        = list(string)
}
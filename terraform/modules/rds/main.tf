# Fetch RDS credentials from AWS Secrets Manager
locals {
  secret_name = var.rds_secret_name == null ? "${var.env}/rds/secret" : var.rds_secret_name
}

data "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = local.secret_name
}

locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)
}

# Security Group for RDS (MySQL)
resource "aws_security_group" "rds_sg" {
  name        = "${var.env}-mysql-rds-sg"
  description = "Allow MySQL access only from bastion"
  vpc_id      = var.vpc_id

  ingress {
    description     = "MySQL from bastion"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.bastion_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-mysql-rds-sg"
    Env  = var.env
  }
}

# DB Subnet Group (Private Subnet Only)
resource "aws_db_subnet_group" "this" {
  name       = "${var.env}-mysql-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.env}-mysql-subnet-group"
    Env  = var.env
  }
}

# MySQL RDS Instance
resource "aws_db_instance" "this" {
  identifier = "${var.env}-mysql-rds"

  engine         = "mysql"
  instance_class = var.db_instance_class

  allocated_storage = var.db_allocated_storage

  db_name  = var.db_name
  username = local.db_creds.username
  password = local.db_creds.password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  multi_az = false
  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = "${var.env}-mysql-rds"
    Env  = var.env
  }
}
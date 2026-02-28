# Security Group for RDS (MySQL)
resource "aws_security_group" "rds-sg" {
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
  subnet_ids = [var.private_subnet_id]

  tags = {
    Name = "${var.env}-mysql-subnet-group"
    Env  = var.env
  }
}

# MySQL RDS Instance
resource "aws_db_instance" "this" {
  identifier = "${var.env}-mysql-rds"

  engine         = "mysql"
  engine_version = var.db_engine_version
  instance_class = var.instance_class

  allocated_storage = var.allocated_storage

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id]

  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = "${var.env}-mysql-rds"
    Env  = var.env
  }
}
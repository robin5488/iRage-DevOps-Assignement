# Security Group for Bastion Host
resource "aws_security_group" "bastion_sg" {
  name        = "${var.env}-bastion-sg"
  description = "Allow SSH access to bastion host"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from allowed IPs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.my_ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env}-bastion-sg"
    Env  = var.env
  }
}

# Bastion EC2 Instance
resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami_id
  instance_type               = var.bastion_instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "${var.env}-bastion"
    Env  = var.env
  }
}
output "bastion_instance_id" {
  description = "Bastion EC2 instance ID"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Public IP of bastion host"
  value       = aws_instance.bastion.public_ip
}

output "bastion_sg_id" {
  description = "Security Group ID of bastion"
  value       = aws_security_group.bastion_sg.id
}
output "rds_endpoint" {
  description = "MySQL RDS endpoint"
  value       = aws_db_instance.this.endpoint
}

output "rds_sg_id" {
  description = "RDS security group ID"
  value       = aws_security_group.rds_sg.id
}
#env values
env                   = "staging"

#network values
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidr    = "10.0.1.0/24"
private_subnet_cidr   = "10.0.2.0/24"
availability_zone     = "us-east-1a"

#bastion-ec2 values
bastion_instance_type = "t3.micro"
bastion_ami_id        = "ami-0f5ee92e2d63afc18"
my_ip                 = ["192.168.1.37/32"]
key_name              = "my-ssh-key"

#rds values
db_engine_version    = "8.0.35"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name              = "appdb"
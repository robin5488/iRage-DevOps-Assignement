#env values
env = "staging"

#network values
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]
availability_zones   = ["eu-north-1a", "eu-north-1b"]

#bastion-ec2 values
bastion_instance_type = "t3.micro"
bastion_ami_id        = "ami-073130f74f5ffb161"
my_ip                 = ["103.190.96.92/32"]
key_name              = "my-ssh-key"

#rds values
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name              = "appdb"

profile             = "default"
region              = "us-east-1"
environment         = "development"

# Instance variables
instance_type       = "t2.micro"
key_name            = "awsdevops"
instance_count      = 1

# Network variables
cidr_vpc            = "10.0.0.0/16"
public_subnets_cidr = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnets_cidr= ["10.0.2.0/24", "10.0.3.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b"]

# Route53 variables
route53_zone        = "geo-terraform-test.com"
wildcard            = "instance-test"

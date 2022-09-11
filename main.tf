module "vpc" {
    source              = "./modules//vpc"
    cidr_vpc            = var.cidr_vpc
    public_subnets_cidr = var.public_subnets_cidr
    private_subnets_cidr= var.private_subnets_cidr
    availability_zones  = var.availability_zones   
}

module "ec2" {
    source      = "./modules/ec2"
    instance_ami    = var.instance_ami
    instance_type   = var.instance_type
    instance_count  = var.instance_count
    key_name        = var.key_name
    private_subnets = module.vpc.private_subnets
    region          = var.region
    profile         = var.profile
    environment     = var.environment    
}

module "s3" {
    source  = "./modules/s3"
}

module "route53" {
    source          = "./modules/route53"
    aws_instance    = module.ec2.aws_instance
    route53_zone    = var.route53_zone
    wildcard        = var.wildcard
}
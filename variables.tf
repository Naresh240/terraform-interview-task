# common variables

variable "profile" {
    type = string
}

variable "region" {
    type = string
}

variable "environment" {
    type = string
}

# Instance variables

variable "instance_ami" {
    type = map
    default = {
	  "us-east-1" = "ami-090fa75af13c156b4"
	  "us-west-2" = "ami-0cea098ed2ac54925"
   }
}

variable "instance_type" {
    type = string
}

variable "key_name" {
    type = string
}

variable "instance_count" {
    type = string
}

variable "cidr_vpc" {
    type = string
}

variable "public_subnets_cidr" {
    type = list(string)
}

variable "private_subnets_cidr" {
    type = list(string)
}

variable "availability_zones" {
    type = list(string)
}

# Route53 variables

variable "route53_zone"{
    type = string
}

variable "wildcard"{
    type = string
}
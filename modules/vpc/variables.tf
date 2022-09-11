variable "cidr_vpc" {
    type = string
}

variable "public_subnets_cidr"{
    type = list(string)
}

variable "private_subnets_cidr"{
    type = list(string)
}

variable "availability_zones"{
    type = list(string)
}
variable "kuberntes_version" {
    default = 1.30
    description = "kuberntes version"
}

variable "vpc_cidr" {
    default = "10.10.0.0/16"
    description = "CIDR range for the vpc"
  
}

variable "aws_region" {
     default = "ap-south-1"
  
}


provider "aws" {

    region = var.aws_region
  
}
 data "aws_availability_zones" "available" {}

 locals {
   
   cluster_name = "demo-eks-tf-${random_string.suffix.result}"

 }
  
resource "random_string" "suffix" {
    length = 8
    special = false

}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tf-vpc"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}


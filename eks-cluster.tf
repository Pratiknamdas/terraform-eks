module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.13.1"
  
  cluster_name    = local.cluster_name
  cluster_version = var.kuberntes_version
  subnet_ids      = module.vpc.private_subnets

  enable_irsa = true

  tags = {
    cluster = "demo-cluster"
  }

  vpc_id = module.vpc.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    aws_security_group_ids = [aws_security_group.sg_eks.id]
  }

  eks_managed_node_groups = {

    node_group = {
      min_size     = 1
      max_size     = 3
      desired_size = 1
    }
  }


}
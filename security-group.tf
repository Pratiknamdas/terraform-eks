resource "aws_security_group" "sg_eks" {
    
    name_prefix = "sg_eks"
    vpc_id = module.vpc.vpc_id

}

resource "aws_security_group_rule" "sg-eks-ingress" {
  description       = "allow inbound traffic from eks"

  
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.sg_eks.id
  
  cidr_blocks       = ["10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",]
  
}

resource "aws_security_group_rule" "sg-eks-egress" {

  description       = "allow outbound traffic to anywhere"

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.sg_eks.id
  
  cidr_blocks       = ["0.0.0.0/0"]
  
}

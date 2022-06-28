#module "eks" {
#  source  = "terraform-aws-modules/eks/aws"
#  version = "~> 18.0"
#
#  cluster_name    = var.name
#  cluster_version = "1.21"
#
#  cluster_endpoint_private_access = true
#  cluster_endpoint_public_access  = true
#
#  vpc_id     = aws_vpc.main.id
#  subnet_ids = [aws_subnet.main.id]
#
#  # EKS Managed Node Group(s)
#  eks_managed_node_group_defaults = {
#    disk_size      = 8
#    instance_types = [var.instance_type]
#  }
#
#  eks_managed_node_groups = {
#    blue = {
#      min_size     = 0
#      max_size     = 1
#      desired_size = 0
#
#      instance_types = [var.instance_type]
#      capacity_type  = "SPOT"
#    }
#
#    green = {
#      min_size     = 1
#      max_size     = 2
#      desired_size = 2
#
#      instance_types = [var.instance_type]
#      capacity_type  = "SPOT"
#    }
#  }
#}

resource "aws_security_group" "main" {
  name        = local.product
  description = "Security group for ${var.name}-${var.service} in ${var.environment} for ${var.client}"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "ingress_rules_ssh" {
  description       = "SSH access ingress"
  security_group_id = aws_security_group.main.id
  cidr_blocks       = [var.cidr_block]

  from_port = 22
  to_port   = 22
  protocol  = "tcp"
  type      = "ingress"
}

resource "aws_security_group_rule" "egress_rules_all" {
  description       = "Egress all"
  security_group_id = aws_security_group.main.id
  cidr_blocks       = [var.cidr_block]

  from_port = 0
  to_port   = 0
  protocol  = "-1"
  type      = "egress"
}

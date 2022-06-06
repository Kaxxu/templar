data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    #    values = ["amzn2-ami-hvm-*-x86_64-ebs"] # x64
    values = ["amzn2-ami-hvm-*-arm64-*"] # arm
  }
}

resource "aws_instance" "main" {
  ami                         = data.aws_ami.amazon.id
  instance_type               = var.instance_type
  key_name                    = var.environment
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.main.id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/files/user-data.sh",
    {
      NAME = var.environment
    }
  )
}

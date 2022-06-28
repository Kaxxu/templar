resource "aws_vpc" "main" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = aws_vpc.main.cidr_block
  map_public_ip_on_launch = true
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "main" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = var.cidr_block
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "main" {
  route_table_id = aws_route_table.main.id
  subnet_id      = aws_subnet.main.id
}

resource "aws_main_route_table_association" "main" {
  route_table_id = aws_route_table.main.id
  vpc_id         = aws_vpc.main.id
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

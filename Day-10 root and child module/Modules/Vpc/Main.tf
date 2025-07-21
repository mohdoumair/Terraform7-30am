resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_1
  availability_zone = var.az_1
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_2
  availability_zone = var.az_2
}
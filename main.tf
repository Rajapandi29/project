
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "demo-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.public_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "demo-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block
  availability_zone = var.private_availability_zone
  tags = {
    Name = "private-subnet"

  }
}
resource "aws_security_group" "my" {
  name = "my-group"
  description = "Allow services"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  ingress {
    from_port    = 443
    to_port      = 443
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
  ingress{
    from_port    = 8080
    to_port      = 8080
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
}
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main.id
  tags {
    Name = "my-route"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags{
    Name = "my-gateway"
  }
}
resource "aws_route" "internet" {
  route_table_id = aws_route_table.route.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id = aws_internet_gateway.igw.id
}
resource "aws_route_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.route.id
}
resource "aws_NAT_gateway" "my-nat" {
  vpc_id = aws_vpc.main.id
  tags{
    Name = "my-nat"
  }
}
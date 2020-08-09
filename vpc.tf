resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    tags = {
        Name = "Main"
        Location = "Mumbai"
    }
}

#Public Subnet
resource "aws_subnet" "public_subnet" {
    cidr_block = var.subnet_cidr_1
    availability_zone = "ap-south-1a"
    vpc_id = aws_vpc.main.id
    map_public_ip_on_launch = "true"
    tags = {
        Name = "Public_Subnet"
    }
}

#Private Subnet
resource "aws_subnet" "private_subnet" {
    cidr_block = var.subnet_cidr_2
    availability_zone = "ap-south-1b"
    vpc_id = aws_vpc.main.id
    map_public_ip_on_launch = "false"
    tags = {
        Name = "Private_Subnet"
    }
}

# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

# route tables
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# route associations public
resource "aws_route_table_association" "main-public-1" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
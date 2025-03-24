#Create VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "ec2_VPC"
  }
}

# Create a Public Subnet
resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true            #this is making the subnet public, The map_public_ip_on_launch = true parameter 
                                            #automatically assigns a Public IP to instances in the subnet when they are launched.
                                            
  tags = {                                 #If this value were set to false, even if a subnet had a route to an Internet Gateway, 
    Name = "Public Subnet"                      #the instance would not be accessible without assigning an Elastic IP (EIP) or using a NAT Gateway.
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "MainIGW"
  }
}

# Create a Route Table
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}
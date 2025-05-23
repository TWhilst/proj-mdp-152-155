/// VPC
resource "aws_vpc" "Project1" {
  cidr_block           = "10.0.0.0/20"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

/// Subnets
resource "aws_subnet" "Project1_public" {
  availability_zone       = "us-west-2a"
  vpc_id                  = aws_vpc.Project1.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.12.0/24"

  tags = {
    Name = "main-public"
  }
}

resource "aws_subnet" "Project1_public_b" {
  availability_zone       = "us-west-2b"
  vpc_id                  = aws_vpc.Project1.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.14.0/24"

  tags = {
    Name = "main-public-b"
  }
}

resource "aws_subnet" "Project1_private" {
  availability_zone = "us-west-2a"
  vpc_id            = aws_vpc.Project1.id
  cidr_block        = "10.0.9.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "main-private"
  }
}

resource "aws_subnet" "Project1_private_b" {
  availability_zone = "us-west-2b"
  vpc_id            = aws_vpc.Project1.id
  cidr_block        = "10.0.5.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "main-private-b"
  }
}

/// Internet Gateway
resource "aws_internet_gateway" "Project1_igw" {
  vpc_id = aws_vpc.Project1.id

  tags = {
    Name = "main-igw"
  }
}

/// Key Pair
resource "aws_key_pair" "Project1_key" {
  key_name   = "toche-key1"
  public_key = file("~/.ssh/toche-key1.pub") # Path to your public key
}


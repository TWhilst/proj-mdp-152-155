///Route Table
resource "aws_route_table" "Project1_rt" {
  vpc_id = aws_vpc.Project1.id

  tags = {
    Name = "main-rt"
  }
}

resource "aws_route_table" "Project1_rt_private" {
  vpc_id = aws_vpc.Project1.id

  tags = {
    Name = "main-rt-private"
  }
}

resource "aws_route_table" "Project1_rt_private_b" {
  vpc_id = aws_vpc.Project1.id

  tags = {
    Name = "main-rt-private_b"
  }
}

/// Route
resource "aws_route" "Project1_route" {
  route_table_id         = aws_route_table.Project1_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Project1_igw.id
}

resource "aws_route" "Project1_route_private" {
  route_table_id         = aws_route_table.Project1_rt_private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.Project1_nat.id
}

resource "aws_route" "Project1_route_private_b" {
  route_table_id         = aws_route_table.Project1_rt_private_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.Project1_nat_b.id
}

// Route Table Association
resource "aws_route_table_association" "Project1_rta" {
  subnet_id      = aws_subnet.Project1_public.id
  route_table_id = aws_route_table.Project1_rt.id
}

resource "aws_route_table_association" "Project1_rta_b" {
  subnet_id      = aws_subnet.Project1_public_b.id
  route_table_id = aws_route_table.Project1_rt.id
}

resource "aws_route_table_association" "Project1_rta1" {
  subnet_id      = aws_subnet.Project1_public1.id
  route_table_id = aws_route_table.Project1_rt.id
}

resource "aws_route_table_association" "Project1_rta1_b" {
  subnet_id      = aws_subnet.Project1_public1_b.id
  route_table_id = aws_route_table.Project1_rt.id
}

resource "aws_route_table_association" "Project1_rta_private" {
  subnet_id      = aws_subnet.Project1_private.id
  route_table_id = aws_route_table.Project1_rt_private.id
}

resource "aws_route_table_association" "Project1_rta_private_b" {
  subnet_id      = aws_subnet.Project1_private_b.id
  route_table_id = aws_route_table.Project1_rt_private_b.id
}
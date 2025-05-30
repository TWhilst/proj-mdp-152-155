# resource "aws_eip" "Project1_eip" {
#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.Project1_igw]
#   tags = {
#     Name = "main-eip"
#   }
# }

# resource "aws_eip" "Project1_eip_b" {
#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.Project1_igw]
#   tags = {
#     Name = "main-eip-b"
#   }
# }

/// NAT Gateway
# resource "aws_nat_gateway" "Project1_nat" {
#   allocation_id = aws_eip.Project1_eip.id
#   subnet_id     = aws_subnet.Project1_public.id

#   tags = {
#     Name = "main-nat"
#   }
# }

# resource "aws_nat_gateway" "Project1_nat_b" {
#   allocation_id = aws_eip.Project1_eip_b.id
#   subnet_id     = aws_subnet.Project1_public_b.id

#   tags = {
#     Name = "main-nat-b"
#   }
# }
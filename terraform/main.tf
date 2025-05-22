resource "aws_vpc" "Project1" {
  cidr_block           = "10.0.0.0/20"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "Project1_public" {
  availability_zone       = "us-west-2a"
  vpc_id                  = aws_vpc.Project1.id
  map_public_ip_on_launch = true
  cidr_block              = "10.0.12.0/24"

  tags = {
    Name = "main-public"
  }
}

resource "aws_internet_gateway" "Project1_igw" {
  vpc_id = aws_vpc.Project1.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "Project1_rt" {
  vpc_id = aws_vpc.Project1.id

  tags = {
    Name = "main-rt"
  }
}

resource "aws_route" "Project1_route" {
  route_table_id         = aws_route_table.Project1_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Project1_igw.id
}

// Route Table Association
resource "aws_route_table_association" "Project1_rta" {
  subnet_id      = aws_subnet.Project1_public.id
  route_table_id = aws_route_table.Project1_rt.id
}

resource "aws_security_group" "Project1_sg_ssh" {
  vpc_id      = aws_vpc.Project1.id
  name        = "main-sg-ssh"
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Project1_sg_http" {
  vpc_id      = aws_vpc.Project1.id
  name        = "main-sg-http"
  description = "Allow HTTP access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Project1_sg_jenkins" {
  vpc_id      = aws_vpc.Project1.id
  name        = "main-sg-jenkins"
  description = "Allow Jenkins access"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Project1_sg_sq" {
  vpc_id      = aws_vpc.Project1.id
  name        = "main-sg-sq"
  description = "Allow Sonarqube access"

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "Project1_key" {
  key_name   = "toche-key1"
  public_key = file("~/.ssh/toche-key1.pub") # Path to your public key
}

resource "aws_instance" "build_server" {
  ami                    = data.aws_ami.server_ami.id
  instance_type          = "t2.medium"
  subnet_id              = aws_subnet.Project1_public.id
  vpc_security_group_ids = [aws_security_group.Project1_sg_ssh.id, aws_security_group.Project1_sg_http.id, aws_security_group.Project1_sg_jenkins.id]
  key_name               = aws_key_pair.Project1_key.key_name
  user_data              = file("~/.vscode/proj-mdp-152-155/script.sh")

  tags = {
    Name = "build-server"
  }
}


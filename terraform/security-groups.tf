/// Security Groups
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
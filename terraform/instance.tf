/// EC2 Instance
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

resource "aws_instance" "deploy_server" {
  ami                    = data.aws_ami.server_ami.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.Project1_private.id
  vpc_security_group_ids = [aws_security_group.Project1_sg_ssh.id, aws_security_group.Project1_sg_http.id, aws_security_group.Project1_sg_jenkins.id]
  key_name               = aws_key_pair.Project1_key.key_name
  user_data              = file("~/.vscode/proj-mdp-152-155/deploy.sh")

  tags = {
    Name = "deploy-server"
  }
}
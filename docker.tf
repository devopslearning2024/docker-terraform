resource "aws_instance" "nginx-server" {
  ami           = var.ami
  instance_type = var.type
  key_name      = "terraform-key"
  vpc_security_group_ids = [
    aws_security_group.nginx.id
  ]
  user_data = file("support.sh")

  tags = {
    Name = "Nginx-server"
  }
}

resource "aws_security_group" "nginx" {
  name_prefix = "nginx-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

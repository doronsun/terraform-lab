provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Security group for web server"
  vpc_id      = "vpc-0be3e96f667974ed7"  # מה שמצאת

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami                    = "ami-020cba7c55df1f615"          # מה שמצאת (Ubuntu 24.04)
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0524876e79fb0ddab"       # מה שמצאת
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "devops-lab"
  }
}


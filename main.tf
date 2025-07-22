provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "web" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = var.instance_type
  tags = {
    Name = "devops-lab"
  }
}


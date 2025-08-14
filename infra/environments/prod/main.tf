resource "aws_instance" "TienEC2" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"

  tags = {
    Name = var.name
  }
}


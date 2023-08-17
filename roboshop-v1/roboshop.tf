resource "aws_instance" "instances" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    name = "frontend"
  }
}
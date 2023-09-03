resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-0523b29cdf9780811" ]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z058570517M4881XN7FK9"
  name    = "frontend.soujandevops.online"
  ttl     = 30
  type    = "A"
  rocords = [ aws_instance.frontend.private_ip]

}

resource "aws_instance" "mongodb" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg-0523b29cdf9780811" ]

  tags = {
    Name = "mongodb"
  }
}
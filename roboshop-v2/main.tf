variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "security_groups" {
  default = [ "sg-0523b29cdf9780811" ]
}

variable "component" {
  default = {
    frontend = { name = "frontend" }
    catalogue = { name = "catalogue" }
    mongodb = { name = "mongodb" }
    user = { name = "user" }
    redis = { name = "redis" }
    cart = { name = "cart" }
    mysql = { name = "mysql" }
    shipping = { name = "shipping" }
    payment = { name = "payment" }
    rabbitmq = { name = "rabbitmq" }

  }
}

resource "aws_instance" "instance" {
  for_each               = var.component
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {

    Name = lookup(each.value, "name", null )
  }

}
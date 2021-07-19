resource "aws_security_group" "Demo" {
  name = "Demo-SG"
  tags {
        Name = "Demo-SG"
  }
  description = "Demo SG"
  egress {
    from_port   = 0
    to_port     = 65535 # All outbound traffic
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
   }
   ingress {
     from_port   = 443
     to_port     = 443 # All outbound traffic
     protocol    = "TCP"
     cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-example"
  }
}

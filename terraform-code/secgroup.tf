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

resource "aws_instance" "demo_ec2" {
  ami                         = "ami-09c5e030f74651050"
  instance_type               = "t3.nano"
  key_name                    = "alex-key"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.Demo]

  root_block_device {
      encrypted   = true
      volume_size = "10"
  }

  tags = {
    Name = "terraform-demo-ec2"
  }
}

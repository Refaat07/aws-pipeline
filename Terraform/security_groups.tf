resource "aws_security_group" "allowPublicSSH" {
  name        = "allowPublicSSH"
  description = "Allows SSH connections"
  vpc_id      = module.network_module.vpc_id

  ingress {
    description = "Allows SSH traffic from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Public 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allowPublicSSH"
  }
}

resource "aws_security_group" "allowPrivateSSH" {
  name        = "allowPrivateSSH"
  description = "Allows private SSH connections"
  vpc_id      = module.network_module.vpc_id

  ingress {
    description = "Allows SSH traffic from inside the same CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

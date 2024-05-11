data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}


resource "aws_instance" "publicInstance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.machine_details["type"]
  subnet_id                   = module.network_module.subnets["publicSubnet1"].id 
  vpc_security_group_ids      = [aws_security_group.allowPublicSSH.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.pubKeyPair.key_name
  user_data                   = <<-EOF
              #!/bin/bash
              echo '${tls_private_key.rsa_generator.private_key_pem}' > /home/ubuntu/private_key.pem
              chmod 400 private_key.pem
            EOF
  
  provisioner "local-exec" {
    command = "echo Bastion_EC2_Public_IP: ${self.public_ip}" 
  }

  tags = {
    Name = "${var.common_resource_name}_Bastion_EC2"
  }
}


resource "aws_instance" "privateInstance" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.machine_details["type"]
  subnet_id                   = module.network_module.subnets["privateSubnet1"].id
  vpc_security_group_ids      = [aws_security_group.allowPrivateSSH.id]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.pubKeyPair.key_name
  tags = {
    Name = "${var.common_resource_name}_Private_EC2"
  }

}
resource "tls_private_key" "rsa_generator" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "pubKeyPair" {
  key_name   = "tfkey"
  public_key = tls_private_key.rsa_generator.public_key_openssh
}

resource "local_file" "privKeyPair" {
  filename = "tfkey.pem"
  content  = tls_private_key.rsa_generator.private_key_pem
}
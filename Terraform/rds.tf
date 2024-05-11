resource "aws_db_subnet_group" "dbsubnetgroup" {
  name       = "cloud_pd44_dbsubnetgroup"
  subnet_ids = [module.network_module.subnets["privateSubnet1"].id, module.network_module.subnets["privateSubnet2"].id]
  
  tags = {
    Name = "${var.common_resource_name}_dbsubnetgroup"
  }
}


resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "mrefaatDB"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "mrefaat"
  password             = "test123##"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name   = aws_db_subnet_group.dbsubnetgroup.name
}


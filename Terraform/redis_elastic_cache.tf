resource "aws_elasticache_subnet_group" "redisSubnetGroup" {
  name       = "redis-subnet-group"
  subnet_ids = [module.network_module.subnets["privateSubnet1"].id, module.network_module.subnets["privateSubnet2"].id]

  tags = {
    Name = "${var.common_resource_name}_Redis_Elasticache_Subnet_Group"
  }
}

resource "aws_elasticache_cluster" "redisCluster" {
  cluster_id           = "cluster"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redisSubnetGroup.name
}

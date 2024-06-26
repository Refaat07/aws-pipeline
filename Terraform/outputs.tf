output "rds_hostname" {
  value = aws_db_instance.rds.endpoint
}

output "rds_username" {
  value = aws_db_instance.rds.username
}

output "rds_password" {
  value = aws_db_instance.rds.password
  sensitive = true
}

output "rds_port" {
  value = 3306 
}

data "aws_elasticache_cluster" "redis_cluster" {
  cluster_id = aws_elasticache_cluster.redisCluster.id
}

output "redis_hostname" {
  value = data.aws_elasticache_cluster.redis_cluster.cache_nodes[0].address
}


output "redis_port" {
  value = 6379 // Default Redis port
}

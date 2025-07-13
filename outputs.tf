output "bastion_public_ip" {
  description = "Public IP of the bastion host"
  value       = aws_instance.bastion.public_ip
}

output "api_server_public_ip" {
  description = "Public IP of the API server"
  value       = aws_instance.api_server.public_ip
}

output "clickhouse_private_ip" {
  description = "Private IP of the ClickHouse instance"
  value       = aws_instance.clickhouse.private_ip
}

output "redis_private_ip" {
  description = "Private IP of the Redis instance"
  value       = aws_instance.redis.private_ip
}

output "efs_id" {
  description = "ID of the ClickHouse EFS volume"
  value       = aws_efs_file_system.clickhouse.id
}

output "vpc_id" {
  description = "Main VPC ID"
  value       = aws_vpc.main.id
}

output "vpc_peering_connection_id" {
  description = "VPC Peering connection ID"
  value       = aws_vpc_peering_connection.peer.id
}

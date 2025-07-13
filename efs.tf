resource "aws_efs_file_system" "clickhouse" {
  creation_token = "clickhouse-efs"
  tags = {
    Name = "clickhouse-efs"
  }
}

resource "aws_efs_mount_target" "clickhouse" {
  file_system_id  = aws_efs_file_system.clickhouse.id
  subnet_id       = aws_subnet.private.id
  security_groups = [aws_security_group.clickhouse_sg.id]
}

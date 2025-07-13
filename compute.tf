resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  tags = { Name = "bastion-host" }
}

resource "aws_instance" "api_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.api_sg.id]
  associate_public_ip_address = true
  tags = { Name = "api-server" }
}

resource "aws_instance" "clickhouse" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.clickhouse_sg.id]
  tags = { Name = "clickhouse" }

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install -y nfs-common
              mkdir -p /var/lib/clickhouse
              mount -t nfs4 -o nfsvers=4.1 ${aws_efs_file_system.clickhouse.dns_name}:/ /var/lib/clickhouse
              echo '${aws_efs_file_system.clickhouse.dns_name}:/ /var/lib/clickhouse nfs4 defaults,_netdev 0 0' >> /etc/fstab
              apt install -y apt-transport-https ca-certificates dirmngr gnupg
              apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4
              echo "deb https://packages.clickhouse.com/deb stable main" | tee /etc/apt/sources.list.d/clickhouse.list
              apt update
              apt install -y clickhouse-server clickhouse-client
              systemctl enable clickhouse-server
              systemctl start clickhouse-server
              EOF
}

resource "aws_instance" "redis" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.redis_sg.id]
  tags = { Name = "redis-cluster" }
}
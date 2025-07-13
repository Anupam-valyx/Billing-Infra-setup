resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = aws_vpc.main.id
  peer_vpc_id   = var.peer_vpc_id
  auto_accept   = true
  tags = { Name = "main-to-feeder-peer" }
}

resource "aws_route" "peer_route_main" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = var.peer_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route" "peer_route_public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = var.peer_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
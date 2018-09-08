resource "aws_vpc_peering_connection" "this" {
  count = "${var.create_vpc_peering}"

  peer_owner_id = "${var.owner_account_id}"
  peer_vpc_id   = "${var.vpc_peer_id}"
  vpc_id        = "${var.vpc_id}"
  auto_accept   = "${var.auto_accept_peering}"
}

resource "aws_route" "target_private_route_table" {
  count = "${var.create_vpc_peering ? var.target_private_route_count : 0}"

  route_table_id            = "${element(var.target_private_route_table_ids, count.index)}"
  destination_cidr_block    = "${var.source_peer_cird_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.this.id}"
}

resource "aws_route" "target_public_route_table" {
  count = "${var.create_vpc_peering ? var.target_public_route_count : 0}"

  route_table_id            = "${element(var.target_public_route_table_ids, count.index)}"
  destination_cidr_block    = "${var.source_peer_cird_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.this.id}"
}

resource "aws_route" "source_private_route_table" {
  count = "${var.create_vpc_peering ? var.source_private_route_count : 0}"

  route_table_id            = "${element(var.source_private_route_table_ids, count.index)}"
  destination_cidr_block    = "${var.target_peer_cird_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.this.id}"
}

resource "aws_route" "source_public_route_table" {
  count = "${var.create_vpc_peering ? var.source_public_route_count : 0}"

  route_table_id            = "${element(var.source_public_route_table_ids, count.index)}"
  destination_cidr_block    = "${var.target_peer_cird_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.this.id}"
}

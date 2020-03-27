resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.jitsi-meet-server.id}"
  allocation_id = "${var.eip_id}"
}

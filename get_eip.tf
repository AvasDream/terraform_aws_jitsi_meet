data "aws_eip" "jitsi-eip" {
  public_ip = "${var.eip}"
}

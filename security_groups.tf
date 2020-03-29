resource "aws_security_group" "allow_connections_jitsi-meet" {
  name        = "allow_connections_jitsi-meet"
  description = "Allow TLS inbound traffic for ssh but only for host PCs external IP."
  #vpc_id      = "${aws_vpc.jitsi_no_hostnames_vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = concat(formatlist("%s/32", list(chomp(data.http.external_ip.body))), var.ip_whitelist)
  }
  ingress {
    from_port   = 10000
    to_port     = 10000
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_connections_jitsi-meet"
  }
}

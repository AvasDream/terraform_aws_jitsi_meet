/* resource "aws_vpc" "jitsi_no_hostnames_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = false
}

resource "aws_subnet" "jitsi-meet_subnet" {
  vpc_id     = "${aws_vpc.jitsi_no_hostnames_vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet for jitsi meet"
  }
}

resource "aws_internet_gateway" "gw-jitsi" {
  vpc_id = "${aws_vpc.jitsi_no_hostnames_vpc.id}"
} */

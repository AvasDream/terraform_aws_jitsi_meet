/* 
  Define the AWS Instance
*/
data "template_file" "install_script" {
  /* File template for the install script */
  template = "${file("install_jitsi.tpl")}"
  vars = {
    email_address = "${var.email_address}"
    domain_name   = "${var.domain_name}"
    #public_aws_dns = "${aws_instance.jitsi-meet-server.public_dns}"
  }
}
resource "aws_instance" "jitsi-meet-server" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.allow_connections_jitsi-meet.id}"]
  key_name               = "${var.ssh_key_name}"
  user_data              = "${data.template_file.install_script.rendered}"
  #subnet_id              = "${aws_subnet.jitsi-meet_subnet.id}"
  tags = {
    Name = "jitsi-meet-server"
  }
  #associate_public_ip_address = "false"
  #depends_on = ["aws_internet_gateway.gw-jitsi"]
  /* This local exec is just for convenience and opens the ssh sessio. */
  provisioner "local-exec" {
    command = "echo putty -ssh ubuntu@${var.eip} 22 -i '${var.ssh_key_path}'"
  }
}


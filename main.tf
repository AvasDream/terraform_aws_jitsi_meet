/* 
  Define the AWS Instance
*/
data "template_file" "install_script" {
  /* File template for the install script */
  template = "${file("install_jitsi.sh")}"
}
resource "aws_instance" "jitsi-meet-server" {
  ami                    = "${data.aws_ami.ubuntu.id}"
  instance_type          = "t2.large"
  vpc_security_group_ids = ["${aws_security_group.allow_connections_jitsi-meet.id}"]
  key_name               = "${var.ssh_key_name}"
  user_data              = "${data.template_file.install_script.rendered}"
  tags = {
    Name = "jitsi-meet-server"
  }

  /* This local exec is just for convenience and opens the ssh sessio. */
  provisioner "local-exec" {
    command = "echo putty -ssh ubuntu@${var.eip} 22 -i '${var.ssh_key_path}'"
  }
}


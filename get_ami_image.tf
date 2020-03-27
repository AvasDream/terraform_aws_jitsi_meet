/* 
This file is dedicated to finding the right Ubuntu AMI to install on  our server. 
AMI IDs change from region to region and change over time as  upgrades come out. 
We're going to create a data source to track down the right one.
A data source is a read-only view into data stored  outside of Terraform. 
In this case, we are creating an aws_ami data source with the unique identifier of ubuntu.
 */
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

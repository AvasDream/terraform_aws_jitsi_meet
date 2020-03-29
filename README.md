# Problem

letsencryp http1 challenge cant find path

```
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator webroot, Installer None
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for conference.avasdream.online
Using the webroot path /usr/share/jitsi-meet for all unmatched domains.
Waiting for verification...
Challenge failed for domain conference.avasdream.online
http-01 challenge for conference.avasdream.online
Cleaning up challenges
Some challenges have failed.

IMPORTANT NOTES:
 - The following errors were reported by the server:

   Domain: conference.avasdream.online
   Type:   unauthorized
   Detail: Invalid response from
   http://conference.avasdream.online/.well-known/acme-challenge/HvlUbxRkABGarCUT3-kONx0C3JjKu7SngkKmu46i1qI
   [3.126.129.69]: "<html>\r\n<head><title>404 Not
   Found</title></head>\r\n<body>\r\n<center><h1>404 Not
   Found</h1></center>\r\n<hr><center>nginx/1.15.9 (Ub"

   To fix these errors, please make sure that your domain name was
   entered correctly and the DNS A/AAAA record(s) for that domain
   contain(s) the right IP address.

```

Tried:

- disable ipv6
- set google dns server & open udp/53
- manually install and generate certificates
- setup vpc, subnet and internet gateway for aws networking and do anything manually.
- sdgfzwHIRGUOÜRGHI\*=Qeghi+0

fuck my life. computers were a mistake

# Requirements

- Terraform is installed and in the current \$PATH
- You know your AWS access and secret keys. [Official Documentation](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html)
- You created an AWS SSH Key. [Official Documentation](https://docs.aws.amazon.com/ground-station/latest/ug/create-ec2-ssh-key-pair.html)

# Setup

1. Create a variables.tf file.
2. Copy example Content in Variables file. Enter your own access and secret key and change instance size preferences.
3. Enter the name of your Aws EC2 ssh key name. If you are on windows you can also enter the path to the ssh key for a convenient putty command to directly connect to the instance.
4. Execute `terraform init`
5. Execute `terraform apply`

variables.tf file:

```
variable "aws_access_key" {
  description = "Access key from AWS"
  default = "D0NTPV5HCR3DST0G1THVB"
}
variable "aws_secret_key" {
  description = "Secret key from AWS"
  default = "D0NTPV5HCR3DST0G1THVB"
}
variable "aws_region" {
  description = "Region where the instance should be located"
  default = "eu-central-1"
}
variable "ssh_key_path" {
  description = "Path to the aws SSH key"
  default = "C:/Users/...."
}
variable "instance_type" {
  description = "Instance type to launch"
  default = "t2.large"
}
variable "ssh_key_name" {
  description = "Name of the SSH key"
  default = "terraform-key"
}
variable "ip_whitelist" {
  description = "All allowed ingress IPs"
  default = ["1.3.3.7/32"]
}
variable "eip_id" {
  description = "Elastic IP ID associated with the instance"
  default     = "eipalloc-133713371337"
}
variable "eip" {
  description = "Elastic IP associated with the instance"
  default     = "1.3.3.7"
}
```

## References

[Terraform set eip](https://www.terraform.io/docs/providers/aws/r/eip_association.html)

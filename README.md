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

# Requirements

- Terraform is installed and in the current \$PATH
- You know your AWS access and secret keys. [Official Documentation](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html)
- You created an AWS SSH Key. [Official Documentation](https://docs.aws.amazon.com/ground-station/latest/ug/create-ec2-ssh-key-pair.html)
- You allocated a Elastic IP in AWS.
- You own a domain Name and created a A Record entry for the Elastic IP.

# Setup

1. Create a variables.tf file.
2. Copy example Content in Variables file.
3. Enter your own data.
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
  description = "Path to the AWS SSH key"
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
variable "eip" {
  description = "Elastic IP associated with the instance"
  default     = "3.126.129.69"
}
variable "email_address" {
  description = "Email to use for the certificate generation"
  default     = "user@domain.de"
}
variable "domain_name" {
  description = "Domain of the Jitsi Server"
  default     = "jitsi.example.com"
}
```

## References

[Terraform set eip](https://www.terraform.io/docs/providers/aws/r/eip_association.html)

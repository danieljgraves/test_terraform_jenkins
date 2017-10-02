variable "aws_region" {
  description = "The AWS region to create things in."
  default = "us-east-2"
}

variable "vpc_id" {
  default = "vpc-02ba436b"
}

variable "eip" {
  default = "eipalloc-6fa6cd41"
}

variable "sub1" {
  description = "Main subnet for US-East-2 VPC"
  default = "subnet-83b27bea"
}

variable "sub2" {
  description = "Main subnet for US-East-2 VPC"
  default = "subnet-ea0c1792"
}

variable "sub3" {
  description = "Main subnet for US-East-2 VPC"
  default = "subnet-69bd8423"
}

variable "availability_zones" {
  default = "us-east-2b,us-east-2c,us-east-2a"
  description = "List of availability zones, use AWS CLI to find your "
}
variable "key_name" {
  default = "deploy"
  description = "Name of AWS key pair"
}

variable "public_key_path" {
  default = "~/.ssh/deploy.pem"
  description = "Path to public key file"
}

variable "instance_type" {
  default = "t2.small"
  description = "AWS instance type"
}


## Tags

variable "role" {
  default = "web server"
}

variable "env" {
  default = "dev"
}

variable "hostname" {
  default = "Jenkins-Test"
}

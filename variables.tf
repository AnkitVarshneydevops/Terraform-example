variable "REGION" {
    default = "ap-south-1"
}

variable "AMI" {
    default = "ami-0b5bff6d9495eff69"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "vpc_cidr" {
    default = "10.30.0.0/16"
}

variable "subnet_cidr_1" {
    default = "10.30.1.0/24"
}

variable "subnet_cidr_2" {
    default = "10.30.2.0/24"
}
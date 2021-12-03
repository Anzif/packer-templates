variable "ami_id" {
  type    = string
  default = "Enter the AMI ID here" #Example: ami-052cef05d01020f1d
}

variable "ami_name" {
    type    = string
    default = "Enter a name for AMI"
}

variable "secret_key" {
    type    = string
    default = "Enter the aws secret key here"
}

variable "access_key" {
    type    = string
    default = "Enter the aws access key here"
}

variable "instance_type" {
    default = "Required instance type"
}

variable "region" {
    default = "Required aws AZ/Region"
}

variable "ssh_user" {
    default = "Enter SSH user (ec2-user for amazon-linux)"
}


source "amazon-ebs" "httpd" {
  access_key    = "${var.access_key}"
  secret_key    = "${var.secret_key}"
  ami_name      = "${var.ami_name}"
  instance_type = "${var.instance_type}"
  region        = "${var.region}"
  source_ami    = "${var.ami_id}"
  ssh_username  = "${var.ssh_user}"
  tags = {
    Env  = "PACKER"
    Name = "${var.ami_name}"
  }
}

build {
  sources = ["source.amazon-ebs.httpd"]

  provisioner "shell" {
    script = "source/script.sh"
  }
}

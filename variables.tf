#using variables as we have to learn for prod related workflows
#we can directly create a variable.tf file and define all the variables there
#to be used in the main configuration files for the creation of the terraform infrastructure




variable "ec2_instance_type" {
  default = "t3.micro"
  type    = string
}

variable "ec2_root_storage_size" {
  default = 10
  type    = number
}

variable "ec2_ami_id" {
  default = "ami-06e3c045d79fd65d9" #ubuntu
  type    = string
}
#key pair (login)

resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}

#VPC & Security group
#use default vpc also can be used

resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "my_security_group" {
  name        = "automated-sg"
  description = "till will add a TF generated security group"
  vpc_id      = aws_default_vpc.default.id #interpolation(inherent or extract the value from a terrafrom block)

  #inbound rule = ingress
  #outbound rule = egress
  #cidr block = source range of IP addresses

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Flask App"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "automated-sg"
  }
}
#instance creation
resource "aws_instance" "my-instance" {
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = var.ec2_instance_type
  ami             = var.ec2_ami_id #ubuntu #amazonmachineimage
  user_data       = file("install_nginx.sh")
  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
  }
  tags = {
    Name = "My-First-EC2-Instance"
  }

}

#output file

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my-instance.public_ip
}

output "ec2_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.my-instance.private_ip
}

output "ec2_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.my-instance.public_dns
}
output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.my-instance.id
}


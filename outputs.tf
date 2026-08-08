output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.demo.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.demo.public_ip
}

output "ssh_command" {
  description = "Ready-to-use SSH command to connect to the instance"
  value       = "ssh -i <path-to-your-key>.pem ec2-user@${aws_instance.demo.public_ip}"
}

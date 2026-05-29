output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.app_server.public_dns
}

output "app_url" {
  description = "Application URL"
  value       = "http://${aws_instance.app_server.public_ip}"
}

output "ssh_private_key" {
  description = "Private SSH key to connect to EC2 (add to GitHub Secrets as EC2_SSH_KEY)"
  value       = tls_private_key.ec2_key.private_key_pem
  sensitive   = true
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i private_key.pem ubuntu@${aws_instance.app_server.public_ip}"
}

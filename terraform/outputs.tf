output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.app_alb.dns_name
}

output "app_url" {
  description = "Application URL (via Load Balancer)"
  value       = "http://${aws_lb.app_alb.dns_name}"
}

output "asg_name" {
  description = "Auto Scaling Group name (used in CD pipeline)"
  value       = aws_autoscaling_group.app_asg.name
}

output "ssh_private_key" {
  description = "Private SSH key to connect to EC2 instances (for debugging)"
  value       = tls_private_key.ec2_key.private_key_pem
  sensitive   = true
}

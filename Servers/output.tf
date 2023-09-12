output "Ec2_ip_address" {
  value = aws_instance.devopslabs01[*].public_ip
}

output "Ec2_dns_name" {
  value = aws_instance.devopslabs01[*].public_dns
}
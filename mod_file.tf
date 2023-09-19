module "servers" {
  source  = "./Servers"
  servers = 2
}

output "Ec2_ip_address" {
  value = module.servers.Ec2_ip_address
}

output "Ec2_dns_name" {
  value = module.servers.Ec2_dns_name
}
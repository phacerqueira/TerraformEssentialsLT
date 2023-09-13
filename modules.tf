module "servers" {
  source = "./Servers"
}

module "db" {
  source = "./databases"
}

module "networks" {
  source = "./networking"
}

output "Ec2_ip_address" {
  value = module.servers.Ec2_ip_address
}

output "Ec2_dns_name" {
  value = module.servers.Ec2_dns_name
}
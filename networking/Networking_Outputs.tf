output "VPC_ID" {
    value = aws_vpc.devopslabs01.id
}

output "Network_ACL_ID" {
    value = aws_default_network_acl.devopslabs01.id
}

output "Secugity_Group_ID" {
    value = aws_security_group.devopslabs01.id  
}

output "Subnet_ID" {
    value = aws_subnet.devopslabs01.id
}

output "Internet_Gateway_ID" {
    value = aws_internet_gateway.devopslabs01.id
}

output "Route_Table_ID" {
    value = aws_route.devopslabs01.id
}
output "project_region"{
  value = var.region
}

output "TFproj_VPC" {
  value = aws_vpc.TFproj_VPC.id
}

output "TFproj_SG" {
  value = aws_security_group.TFproj_SG.id
  description = "Opened ports are: 443, 80, 22"
}
###Subnets###
output "TFproj_subnet-1" {
  value = aws_subnet.TFproj_subnet-1.id
}

output "Is_subnet-1_public" {
  value = aws_subnet.TFproj_subnet-1.map_public_ip_on_launch
}

output "TFproj_subnet-2" {
  value = aws_subnet.TFproj_subnet-2.id
}

output "Is_subnet-2_public" {
  value = aws_subnet.TFproj_subnet-2.map_public_ip_on_launch
}

output "TFproj_subnet-3" {
  value = aws_subnet.TFproj_subnet-3.id
}

output "Is_subnet-3_public" {
  value = aws_subnet.TFproj_subnet-3.map_public_ip_on_launch
}

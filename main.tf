provider "aws" {
  region = var.region
}

data "aws_availability_zones" "working" {}

#########resources############

resource "aws_vpc" "TFproj_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "TFproj_VPC"
  }
}

resource "aws_subnet" "TFproj_subnet-1" {
  vpc_id = aws_vpc.TFproj_VPC.id
  cidr_block = var.used_subnets[0]
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.working.names[0]
  tags = { 
    Name= "Tfproj_VPC pub_subnet-1"
  }
}

resource "aws_subnet" "TFproj_subnet-2" {
  vpc_id = aws_vpc.TFproj_VPC.id
  cidr_block = var.used_subnets[1]
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.working.names[1]
  tags = { 
    Name= "Tfproj_VPC pub_subnet-2"
  }
}

resource "aws_subnet" "TFproj_subnet-3" {
  vpc_id = aws_vpc.TFproj_VPC.id
  cidr_block = var.used_subnets[2]
  map_public_ip_on_launch = false
  availability_zone = data.aws_availability_zones.working.names[2]
  tags = { 
    Name= "Tfproj_VPC pri_subnet-3"
  }
}

resource "aws_security_group" "TFproj_SG" {
  vpc_id = aws_vpc.TFproj_VPC.id
  name = "TFproj_SG"
  dynamic "ingress" {
    for_each = var.allowed_inbound_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/16"]
       } 
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name= "TFproj_SG"
  }
}

terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "amit-and-davs"
    key    = "am1/terraform.tfstate"
    region = "eu-west-2"
  }
}
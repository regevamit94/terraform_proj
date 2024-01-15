variable "region" {
    description = "TF project working region"
    default = "eu-west-2"
}

variable "instance_type" {
    description = "TF project instance types"
    default = "t2.micro"
}

variable "allowed_inbound_ports" {
    description = "open inbound ports"
    default = ["443", "22", "80"]  
}

variable "used_subnets" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "aws"{
    region = String
}

variable "aws_vpc"{
    cidr_block = String
}
variable "aws_subnet"{
    cidr_block = String
    availability_zone = String
    
}

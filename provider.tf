terraform{
    required_version = ">1.5"
    required_provider = {
        aws = {
            source = "hashicorp/aws"
        }
        
    }
}
provider "aws" = {
    region = var.region
}
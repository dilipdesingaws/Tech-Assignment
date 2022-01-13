locals {

  env = terraform.workspace

  aws_instance_list = {
    dev = [
      {
        ami_id            = "ami-0d5eff06f840b45e9"
        instance_type     = "t2.micro"
        availability_zone = "us-east-1a"
      }
      # This section is to create Custom domain. This domain has to be a DNS CNAME-record for the default domain (azurefd.net)    
      # {
      #   ami_id : "ami-0d5eff06f840b45e9",
      #   instance_type : "t2.micro"
      #   availability_zone_1 : "us-east-1b"
      # }
    ]
   staging = []
    prod    = []

  }


  aws_instance = lookup(local.aws_instance_list, local.env, null)
}



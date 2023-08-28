locals {
  region = "us-east-1"
  project_name = "netflix"
  tags = {    
    Owner   = "Netflix Devops Team"
    Creator = "team-devops@netflix.com"
    CreationTime    = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}
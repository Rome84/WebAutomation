module "apache-stack" {
  source = "../../"
  name = "apache-stack"
  
  # Default VPC ID
  defaultvpcid = "vpc-0517296d"
  # AMI's
  webserver-redhat_AMIS = "ami-0b500ef59d8335eee"
  webserver-ubuntu_AMIS = "ami-0c55b159cbfafe1f0"

  # Login users:
  redhat-ami-user = "ec2-user"
  ubuntu-ami-user = "ubuntu"
  # Public Subnet
  public_subnet = "subnet-30fcda58"

  # SSH login key name
  key_pair = "apache-stack"

  # Instances to be enabled
  enable-webserver-redhat = true
  enable-webserver-ubuntu = true

  # Instance shape
  webserver-redhat-instance-shape = "t2.micro"
  webserver-ubuntu-instance-shape = "t2.micro"

}

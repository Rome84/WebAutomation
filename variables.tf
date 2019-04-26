variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}

variable "AWS_REGION" {
  default = "us-east-2"
}

variable "defaultvpcid" {
  default = ""
}

variable "webserver-redhat_AMIS" {
  description = "webserver-redhat_AMIS to be used"
  default = ""
}

variable "webserver-ubuntu_AMIS" {
  description = "webserver-ubuntu_AMIS to be used"
  default = ""
}

variable "webserver-redhat-instance-shape" {
  description = "webserver-redhat-instance-shape to be used"
  default = "t2.micro"
}

variable "webserver-ubuntu-instance-shape" {
  description = "webserver-ubuntu-instance-shape to be used"
  default = "t2.micro"
}

variable "private_subnet" {
  description = "private_subnet to be used"
  default     = ""
}

variable "public_subnet" {
  description = "public_subnet to be used"
  default     = ""
}

variable "ubuntu-ami-user" {
  description = "Default Ubuntu user to be used"
  default     = "ubuntu"
}

variable "redhat-ami-user" {
  description = "Default Redhat user to be used"
  default     = "ec2-user"
}

variable "key_pair" {
  description = "key_pair to be used"
  default     = ""
}


variable "enable-webserver-redhat" {
  description = "Should be true if you want to create a artifactory server"
  default     = false
}

variable "enable-webserver-ubuntu" {
  description = "Should be true if you want to create a artifactory server"
  default     = false
}
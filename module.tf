
resource "aws_security_group" "demo-secgrp" {
 name = "demo-secgrp"
 vpc_id = "${var.defaultvpcid}"

  ingress {
    from_port = "443"
    to_port = "443"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

tags {
    Name = "demo-secgrp"
  }
}

resource "aws_key_pair" "mykey1" {
  key_name = "${var.key_pair}"
  public_key = "${file("${var.key_pair}.pub")}"
}

resource "aws_instance" "demo-webserver-redhat" {
  ami = "${var.webserver-redhat_AMIS}"
  instance_type = "${var.webserver-redhat-instance-shape}"
  vpc_security_group_ids = [ "${aws_security_group.demo-secgrp.id}" ]
  key_name = "${aws_key_pair.mykey1.key_name}"
  count = "${var.enable-webserver-redhat}"
  subnet_id      = "${var.public_subnet}"
  provisioner "local-exec" {
     command = "sleep 120 && echo \"[web-server]\n${aws_instance.demo-webserver-redhat.public_ip} ansible_connection=ssh ansible_ssh_user=${var.redhat-ami-user} ansible_ssh_private_key_file=${var.key_pair} ansible_ssh_common_args='-o StrictHostKeyChecking=no'\" > webapp-redhat-inventory &&  ansible-playbook -i webapp-redhat-inventory ansible-playbooks/webapp-create.yml"
  }

  connection {
    user = "${var.redhat-ami-user}"
    private_key = "${file("${var.key_pair}")}"
  }
tags {
    Name = "demo-webserver-redhat"
  }
}

resource "aws_instance" "demo-webserver-ubuntu" {
  ami = "${var.webserver-ubuntu_AMIS}"
  instance_type = "${var.webserver-ubuntu-instance-shape}"
  vpc_security_group_ids = [ "${aws_security_group.demo-secgrp.id}" ]
  key_name = "${aws_key_pair.mykey1.key_name}"
  count = "${var.enable-webserver-ubuntu}"
  subnet_id      = "${var.public_subnet}"
    provisioner "remote-exec" {
     inline = ["sudo apt-get update ; sudo apt-get install python -y"]
  }
  provisioner "local-exec" {
     command = "sleep 180 && echo \"[web-server]\n${aws_instance.demo-webserver-ubuntu.public_ip} ansible_connection=ssh ansible_ssh_user=${var.ubuntu-ami-user} ansible_ssh_private_key_file=${var.key_pair} ansible_ssh_common_args='-o StrictHostKeyChecking=no'\" > webapp-ubuntu-inventory &&  ansible-playbook -i webapp-ubuntu-inventory ansible-playbooks/webapp-create.yml"
  }

  connection {
    user = "${var.ubuntu-ami-user}"
    private_key = "${file("${var.key_pair}")}"
  }
tags {
    Name = "demo-webserver-ubuntu"
  }
}


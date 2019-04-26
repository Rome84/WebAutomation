Terraform Apache Stack
========================

Usage
=====

To run this example you need to execute:

```bash
$ cd terraform-apache-stack/project/webapp
```

Configure AWSCLI:
```bash
$ aws configure
$ ssh-keygen -f apache-stack
```

Terraform Commands:
```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money (AWS Elastic IP, for example). Run `terraform destroy` when you don't need these resources.



Terraform version
-----------------

Terraform version 0.10.3 or newer is required for this module to work.

Project
--------

* [terraform-apache-stack]




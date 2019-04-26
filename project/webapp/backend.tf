terraform {
  backend "s3" {
    bucket = "webautomation-apache-stack-version"
    key = "Apache_Stack_Infra_State"
  }
}

# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "aaslabs"

    workspaces {
      name = "aws-aaslabs"
    }
  }
}

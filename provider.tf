terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.15.0"
    }
  }
}

provider "aws" {
    region = "eu-central-1"
}
provider "aws" {
  # us-east-1 instance
  region = "us-east-1"
  alias = "use1"
}
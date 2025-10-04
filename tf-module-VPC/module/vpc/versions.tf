# This can optional because we can also use it in the main(root) terraform config

terraform {
  required_version = ">=1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.30"
    }
  }
}

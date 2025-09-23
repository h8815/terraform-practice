terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.3.0"
    }
  }


  /* 
    this used in your config file which you need to backup.
    the s3 and dynamobd is created to store the backup file 

    backend "s3" {
        bucket         = "demo-remote-s3-aws-bucket"
        key            = "path to your tfstate file"
        region         = "eu-north-1"
        dynamodb_table = "demo-remote-state-table"
    }

   */
}

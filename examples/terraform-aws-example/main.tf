# ---------------------------------------------------------------------------------------------------------------------
# PIN TERRAFORM VERSION TO >= 0.12
# The examples have been upgraded to 0.12 syntax
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
//      version = "~> 2.60.0"
    }
  }
}

// a provider is responsible for creating and managing resources.
provider "aws" {
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = "us-west-2"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    es             = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    route53        = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
    ec2            = "http://localhost:4566"
  }
}

// The resource block defines a piece of infrastructure
// aws_instance: resource type
// example: resource name
resource "aws_instance" "example" {
  ami           = "ami-0d57c0143330e1fa7"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

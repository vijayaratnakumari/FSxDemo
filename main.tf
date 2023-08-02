terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

data "aws_vpc" "rjn-shared-services-vpc" {
  id = var.vpc_id
}

#subnet ids

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Tier = "private"
  }
}

data "aws_security_group" "default" {
  id = var.aws_security_group_ids
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_directory_service_directory" "example" {
  directory_id = var.aws_directory_service_directory_id
}

resource "aws_fsx_windows_file_system" "windowsfsxad" {

  deployment_type     = var.fsx_deployment_type
  storage_type        = var.fsx_storage_type
  security_group_ids  = [data.aws_security_group.default.vpc_id]
  active_directory_id = data.aws_directory_service_directory.example.directory_id
  for_each            = toset(data.aws_subnets.private.ids)
  subnet_ids          = each.value
  storage_capacity    = var.fsx_storage_capacity
  throughput_capacity = var.fsx_throughput_capacity
  skip_final_backup   = var.fsx_skip_final_backup

  tags = {
    Name = var.fsx_file_system_name
  }
}


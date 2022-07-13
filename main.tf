terraform {
  required_version = "~> 1.2"
  required_providers {
    aws = {
      version = "~>4.0"
      source  = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket  = "merstab-tfstate"
    key     = "serum_vial"
    region  = "eu-central-1"
    profile = "merstab-terraform"
  }
}

provider "aws" {}

module "serum_vial_ecs_service" {
  source = "./iac"

  desired_count = 1
  image_version = "1.7.0"
  cluster_name  = "nebula"
  task_name     = "serum_vial"
}

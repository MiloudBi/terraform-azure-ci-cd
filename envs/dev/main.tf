
terraform {
  required_version = ">= 1.12.1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.33.0"
    }
  }
}
module "az_resource_group" {
  source   = "../../modules/resource_group"
  env      = var.env
  location = var.location
  team_tag = var.team_tag
  creator  = var.creator
}

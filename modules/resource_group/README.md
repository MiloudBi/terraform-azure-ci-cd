# Terraform Modules
### Terraform Module to create Resource Group in Microsoft Azure
#### Tools Used
- Terraform: Version v1.12.1
- Azurerm provider: Version vX.xx.X

#### Parameters to pass
| Parameters | Need | Description
| ------ | ------ | ------ |
source|(Required)|source of this module
env|(Required)|name of the resource group
location|(Required)|location where this resource has to be created
team_tag|(Optional)|tag a team
creator|(Optional)|tag a creator


#### Usage:
```sh
provider "azurerm" {
  version = "=4.33.0"
  features {}
}

module "az_resource_group" {
  source   = "../../modules/resource_group"
  env      = "dev"
  location = "francecentral"
  team_tag = "DevOps"
  creator  = "Miloud"
}
```

#### Terraform Execution:
###### To initialize Terraform:
```sh
terraform init
```

###### To execute Terraform Plan:
```sh
terraform plan
```

###### To apply Terraform changes:
```sh
terraform apply
```
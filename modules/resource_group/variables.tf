variable "name_rg" {
  description = "(Required) name of the resource group"
  type = string
  default = "dev-resource-group01"
}

variable "env" {
  description = "(Required) name of the resource group"
  type = string
  default = "dev"
}

variable "location" {
  description = "(Required) location where this resource has to be created"
  type = string
  default = "francecentral"
}

variable "team_tag" {
  description = "(Optional) tag a team"
  type = string
  default = "DevOps"
}

variable "creator" {
  description = "(Optional) tag a creator"
  type = string
  default =   "Miloud"
}
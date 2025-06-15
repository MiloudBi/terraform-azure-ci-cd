variable "subscription_id" {
	default = "431c2af1-08a1-44f5-b2a1-ac86d6545af9"
}

variable "resource_group_name" {
	default = "resourceGroup02"
}

variable "location" {
	default = "francecentral"
}

variable "vnet_name" {
	default = "vnet01"
}

variable "vnet_address_space"{
	default = ["10.0.0.0/16"]
}

variable "subnet_name" {
	default ="subnet01"
}

variable "subnet_prefix" {
	default = "10.0.1.0/24"
}

variable "vm_name" {
	default = "vm-dev01"
}

variable "admin_username" {
	default = "dev-user"
}

variable "vm_size" {
	default = "Standard_B1s"
}

data "azurerm_key_vault" "dev_vault" {
	name = "miloudVault01"
	resource_group_name = "resourceGroup01"
}

data "azurerm_key_vault_secret" "admin_password" {
	name = "AdminPassword"
	key_vault_id = data.azurerm_key_vault.dev_vault.id
}

resource "azurerm_resource_group" "rg01" {
	name = var.resource_group_name
	location = var.location
}

resource "azurerm_virtual_network" "vnet01" {

	name = var.vnet_name
	address_space = var.vnet_address_space
	location = var.location
	resource_group_name = azurerm_resource_group.rg01.name
}

resource "azurerm_subnet" "subnet01" {

	name = var.subnet_name
	resource_group_name = azurerm_resource_group.rg01.name
	virtual_network_name = azurerm_virtual_network.vnet01.name
	address_prefixes = [var.subnet_prefix]

}

resource "azurerm_network_interface" "net_face01" {

	name = "${var.vm_name}-nic"
	location = var.location
	resource_group_name = azurerm_resource_group.rg01.name
	
	ip_configuration {

		name = "internal"
		subnet_id = azurerm_subnet.subnet01.id
		private_ip_address_allocation = "Dynamic"
		public_ip_address_id = azurerm_public_ip.main.id
}
}

resource "azurerm_public_ip" "main" {

	name = "${var.vm_name}-public-ip"
	location = var.location
	resource_group_name = azurerm_resource_group.rg01.name
	allocation_method = "Static"
	sku = "Standard"
}

resource "azurerm_linux_virtual_machine" "vm01" {

	name = var.vm_name
	resource_group_name = azurerm_resource_group.rg01.name
	location = var.location
	size = var.vm_size
	admin_username = var.admin_username
	admin_password = data.azurerm_key_vault_secret.admin_password.value
	disable_password_authentication = false
	
	network_interface_ids = [azurerm_network_interface.net_face01.id]
	os_disk {
		
		caching = "ReadWrite"
		storage_account_type = "Standard_LRS"
		name = "${var.vm_name}-osdisk"
}
	source_image_reference {

		publisher = "canonical"
		offer = "0001-com-ubuntu-server-jammy"
		sku = "22_04-lts"
		version = "latest"
}
}

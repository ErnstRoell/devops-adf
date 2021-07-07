##################################
### Resource Groups
#################################

resource "azurerm_resource_group" "dev" {
  name = var.resource_group_dev
  location = var.location
}

resource "azurerm_resource_group" "test" {
  name = var.resource_group_test
  location = var.location
}

resource "azurerm_resource_group" "prod" {
  name = var.resource_group_prod
  location = var.location
}

resource "azurerm_resource_group" "mgmt" {
  name = var.resource_group_mgmt
  location = var.location
}

##################################
### Storage Accounts
#################################


resource "azurerm_storage_account" "dev" {
  name                     = var.storage_dev
  resource_group_name      = azurerm_resource_group.dev.name
  location                 = azurerm_resource_group.dev.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_account" "test" {
  name                     = var.storage_test
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}


resource "azurerm_storage_account" "prod" {
  name                     = var.storage_prod
  resource_group_name      = azurerm_resource_group.prod.name
  location                 = azurerm_resource_group.prod.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}


##################################
### Data Factory
#################################

resource "azurerm_data_factory" "dev" {
  name                = var.adf_dev
  location            = var.location
  resource_group_name = azurerm_resource_group.dev.name
  identity {
        type         = "SystemAssigned"
    }
}

resource "azurerm_data_factory" "test" {
  name                = var.adf_test
  location            = var.location
  resource_group_name = azurerm_resource_group.test.name
  identity {
        type         = "SystemAssigned"
    }
}

resource "azurerm_data_factory" "prod" {
  name                = var.adf_prod
  location            = var.location
  resource_group_name = azurerm_resource_group.prod.name
  identity {
        type         = "SystemAssigned"
    }
}


##################################
### Key Vaults
#################################

resource "azurerm_key_vault" "dev" {
  name                = var.kv_dev
  location            = var.location
  resource_group_name = var.resource_group_mgmt
  tenant_id           = var.tenant_id
  purge_protection_enabled = false
  sku_name                 = "standard"
}

resource "azurerm_key_vault" "test" {
  name                = var.kv_test
  location            = var.location
  resource_group_name = var.resource_group_mgmt
  tenant_id           = var.tenant_id
  purge_protection_enabled = false
  sku_name                 = "standard"
}


resource "azurerm_key_vault" "prod" {
  name                = var.kv_prod
  location            = var.location
  resource_group_name = var.resource_group_mgmt
  tenant_id           = var.tenant_id
  purge_protection_enabled = false
  sku_name                 = "standard"
}



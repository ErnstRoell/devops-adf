################################
### Dev 
################################

resource "azurerm_storage_container" "dev" {
  name                  = "source"
  storage_account_name  = azurerm_storage_account.dev.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "sinkdev" {
  name                  = "sink"
  storage_account_name  = azurerm_storage_account.dev.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "dev" {
  name                   = "diabetes.csv"
  storage_account_name   = azurerm_storage_account.dev.name
  storage_container_name = azurerm_storage_container.dev.name
  type                   = "Block"
  source_uri                 = "https://raw.githubusercontent.com/MicrosoftDocs/mslearn-aml-labs/master/data/diabetes.csv"
}



################################
### Dev 
################################


resource "azurerm_storage_container" "test" {
  name                  = "source"
  storage_account_name  = azurerm_storage_account.test.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "sinktest" {
  name                  = "sink"
  storage_account_name  = azurerm_storage_account.test.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "test" {
  name                   = "diabetes.csv"
  storage_account_name   = azurerm_storage_account.test.name
  storage_container_name = azurerm_storage_container.test.name
  type                   = "Block"
  source_uri                 = "https://raw.githubusercontent.com/MicrosoftDocs/mslearn-aml-labs/master/data/diabetes.csv"
}



################################
### Dev 
################################


resource "azurerm_storage_container" "prod" {
  name                  = "source"
  storage_account_name  = azurerm_storage_account.prod.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "sinkprod" {
  name                  = "sink"
  storage_account_name  = azurerm_storage_account.prod.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "prod" {
  name                   = "diabetes.csv"
  storage_account_name   = azurerm_storage_account.prod.name
  storage_container_name = azurerm_storage_container.prod.name
  type                   = "Block"
  source_uri                 = "https://raw.githubusercontent.com/MicrosoftDocs/mslearn-aml-labs/master/data/diabetes.csv"
}




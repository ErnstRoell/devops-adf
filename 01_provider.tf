terraform {
  required_providers {
    azurerm =  "~> 2.33"
    random = "~> 2.2"
  azuread = {
    source  = "hashicorp/azuread"
    version = "=1.3.0"
  } 
 databricks = {
      source  = "databrickslabs/databricks"
      version = "0.3.5"
    } 

azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
}
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
} 

data "azurerm_client_config" "current" {}

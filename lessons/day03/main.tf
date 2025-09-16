terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.44.0"
    }
  }
  required_version = ">=1.13.2"
}

provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "example" {
  name     = "Azuredemo-RG"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "azuredemostorageacc101" # Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
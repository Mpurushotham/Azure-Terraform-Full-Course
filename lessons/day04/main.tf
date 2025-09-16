terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.44.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-day04"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "day0419307"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
  required_version = ">=1.13.2"
}

provider "azurerm" {
    features {
      
    }
  
}

resource "azurerm_resource_group" "example" {
  name     = "Azuredemo-RG-test"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "azuredemostorageacctest"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location # implicit dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
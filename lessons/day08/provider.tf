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
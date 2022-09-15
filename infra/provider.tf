terraform {
  required_version = ">=1.2.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.21.1" //"~>3.7.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.28.1"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
# Configure the Azure provider
terraform {
   backend "azurerm" {
    }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }

  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westus2"

  tags = {
      Environment = "Terraform Getting Started"
      Team= "DevOps"
  }
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["192.168.4.0/24"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}


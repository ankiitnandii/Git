terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
}

provider "azurerm" {
  client_id       = "7d65dbac-c038-475d-8155-da12618dc06d"
  subscription_id = "697cc995-4504-4008-a3ba-9ce4ee4fa089"
  client_secret   = "jkh8Q~sw7vnkwBdIgWnBLbsJWl.c7v6_iKkrkbmd"
  tenant_id       = "a3878642-fd41-4b1f-937a-9bbbba822b02"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name =  "mt-rg01"
    storage_account_name = "mtsauksouth1"
    container_name       = "mttest"
    key                  = "mt-newrelic.demo-terraform.tfstate"
  }
}

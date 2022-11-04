terraform {
  backend "azurerm" {
    storage_account_name = "generalstorageamin"
    container_name       = "webappstate"
    key                  = "webapp.tfstate"
  }
}
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurecaf_name" "app_plan_name" {
  name          = "webvideo"
  resource_type = "azurerm_app_service_plan"
  prefixes      = ["dev"]
  suffixes      = [var.location]
  random_length = 3
  clean_input   = true
}

resource "azurecaf_name" "web_app_name" {
  name          = "webvideo"
  resource_type = "azurerm_app_service"
  prefixes      = ["dev"]
  suffixes      = [var.location]
  random_length = 3
  clean_input   = true
}

module "webapp" {
  source           = "./modules/webapp"
  rg_name          = azurerm_resource_group.rg.name
  location         = azurerm_resource_group.rg.location
  app_plan_name    = azurecaf_name.app_plan_name.result
  app_service_name = azurecaf_name.web_app_name.result
}
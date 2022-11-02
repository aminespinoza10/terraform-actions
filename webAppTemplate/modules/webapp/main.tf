resource "azurerm_service_plan" "service_plan" {
  name                = var.app_plan_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "web_app" {
  name                = var.app_service_name
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.service_plan.id


  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
  }
}
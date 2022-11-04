variable "rg_name" {
  type        = string
  description = "Nombre del grupo de recursos"
}

variable "location" {
  type        = string
  description = "Ubicación del grupo de recursos"
  default     = "eastus2"
}

variable "app_plan_name" {
  type        = string
  description = "Nombre del App Service Plan"
}

variable "app_service_name" {
  type        = string
  description = "Nombre de la aplicación web basada en Linux"
}
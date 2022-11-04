variable "rg_name" {
  type        = string
  description = "Nombre del grupo de recursos"
}

variable "location" {
  type        = string
  description = "Ubicación del grupo de recursos"
  default     = "eastus2"
}


// resource group
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region where the resource group should exist"
  default     = "East US 2"
}

// storage
variable "storage_name" {
  type        = string
  description = "The name for the storage account"
}

variable "storage_account_tier" {
  type        = string
  description = "The Tier to use for storage account"
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  description = "The type of replication to use for storage account"
  default     = "LRS"
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "Allow or disallow nested items within this Account to opt into being public"
  default     = false
}

// service plan
variable "service_plan_name" {
  type        = string
  description = "The name for the service plan"
}

// function app
variable "funtion_app_name" {
  type        = string
  description = "The name of the Linux Function App"
}

variable "sp_os_type" {
  type        = string
  description = "..." //todo: add desc
  default     = "Linux"
  //todo: add validation
}

variable "sp_sku_name" {
  type        = string
  default     = "Y1"
  description = "..." //todo: add desc
  //todo: add validation
}

variable "func_auth_settings_enabled" {
  type        = bool
  description = "..." //todo: add desc  
}
variable "func_auth_settings_version" {
  type        = string
  description = "..." //todo: add desc  
}
variable "func_token_store_enabled" {
  type        = bool
  description = "..." //todo: add desc  
}
variable "storage_container_name" {
  type        = string
  description = ".." //todo: add desc
  //todo: add validation 
  //  Error: only lowercase alphanumeric characters and hyphens allowed in "name": "httpTrigger1_function_app"
}

variable "storage_account_blob_container_sas_start" {
  type        = string
  description = ".." //todo: add desc
}

variable "storage_account_blob_container_sas_expiry" {
  type        = string
  description = ".." //todo: add desc
}

// function app auth_setting
variable "func_app_unauthenticated_client_action" {
  type        = string
  description = ".." //todo: add desc  
}
variable "func_app_default_identity_provider" {
  type        = string
  description = ".." //todo: add desc  
}
variable "func_app_identity_provider_client_id" {
  type        = string
  description = ".." //todo: add desc  
}
variable "func_app_identity_issuer" {
  type        = string
  description = ".." //todo: add desc  
}

//--------- sample-func-app-2 ---------
variable "funtion_app_name2" {
  type = string
}
variable "service_plan_name2" {
  type = string
}
variable "storage_name2" {
  type = string
}
variable "storage_container_name2" {
  type = string
}
variable "func_auth_settings_enabled2" {
  type = bool
}

//--------- diagnostic setting ---------
variable "diag_setting_name" {
  type = string
}
variable "log_analytics_workspace_id" {
  type = string
}
variable "diag_metric_configs_func_app" {
  type = list(any)
}
variable "diag_log_configs_func_app" {
  type = list(any)
}
variable "diag_metric_configs_postgres" {
  type = list(any)
}
variable "diag_log_configs_postgres" {
  type = list(any)
}
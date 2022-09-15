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
variable "storage_name" { //todo: predefine to <functionAppName>store?
  type        = string
  description = "The name for the storage account"
  //todo: validation
  //  Error: name ("funcappexample2storagenew") can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long
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

variable "storage_container_name" {  //todo: this can be predefined as <functionAppName>-functions
  type        = string
  description = ".."//todo: add desc
  validation {
    condition = can(regex("[a-z0-9-]+", var.storage_container_name))
    error_message = "Only lowercase alphanumeric characters and hyphens allowed in storage container name."
  }
}

variable "storage_account_blob_container_sas_start" {
  type = string
  description = ".."//todo: add desc
}

variable "storage_account_blob_container_sas_expiry" {
  type = string
  description = ".."//todo: add desc
}

variable "allow_nested_items_to_be_public" {
  type        = bool
  description = "Allow or disallow nested items within this Account to opt into being public"
  default     = false
}
// function app function
variable "storage_container_access_type" {
  type = string
  default = "private"
  description = "todo..."
}

// service plan
variable "service_plan_name" { //todo: this can be compute from function name
  type        = string
  description = "The name for the service plan"
}

variable "sp_os_type" {
  type        = string
  description = "..." //todo: add desc
  default = "Linux"
  //todo: add validation
}

variable "sp_sku_name" {
  type        = string
  default = "Y1"
  description = "..." //todo: add desc
  //todo: add validation
}

// function app
variable "funtion_app_name" {
  type        = string
  description = "The name of the Linux Function App"
}

variable "auth_settings_enabled" {
  type = bool
  description = "...." // todo: add desc
}

variable "auth_settings_version" {
  type = string
  description = "...." // todo: add desc
}

variable "auth_token_store_enabled" {
  type = bool
  description = "...." // todo: add desc
}
// application insights
variable "app_insights_application_type" {
  type    = string
  default = "web"
  description = "...." // todo: add desc
}

// function app auth_setting
variable "unauthenticated_client_action" {
  type    = string
  description = "...." // todo: add desc  
}

variable "default_identity_provider" {
  type    = string
  description = "...." // todo: add desc 
}

variable "identity_provider_client_id" {
  type    = string
  description = "...." // todo: add desc
}

variable "identity_issuer" {
  type    = string
  description = "...." // todo: add desc
}
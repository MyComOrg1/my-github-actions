resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# module "sample-func-app-1" {
#   source              = "./modules/terraform-azurerm-linux-function-app"
#   resource_group_name = var.resource_group_name
#   location            = var.location
#   service_plan_name   = var.service_plan_name
#   funtion_app_name    = var.funtion_app_name
#   sp_os_type          = var.sp_os_type
#   sp_sku_name         = var.sp_sku_name
#   // storage
#   storage_name                              = var.storage_name
#   storage_account_tier                      = var.storage_account_tier
#   storage_account_replication_type          = var.storage_account_replication_type
#   storage_container_name                    = var.storage_container_name
#   storage_account_blob_container_sas_start  = var.storage_account_blob_container_sas_start
#   storage_account_blob_container_sas_expiry = var.storage_account_blob_container_sas_expiry
#   //auth_setting
#   auth_settings_enabled         = var.func_auth_settings_enabled
#   auth_settings_version         = var.func_auth_settings_version
#   auth_token_store_enabled      = var.func_token_store_enabled
#   unauthenticated_client_action = var.func_app_unauthenticated_client_action
#   default_identity_provider     = var.func_app_default_identity_provider
#   identity_provider_client_id   = var.func_app_identity_provider_client_id
#   identity_issuer               = var.func_app_identity_issuer

#   depends_on = [
#     azurerm_resource_group.rg
#   ]
# }

module "sample-func-app-2" {
  count               = 0
  source              = "./modules/terraform-azurerm-linux-function-app"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_name   = var.service_plan_name2
  funtion_app_name    = var.funtion_app_name2
  sp_os_type          = var.sp_os_type
  sp_sku_name         = var.sp_sku_name
  // storage
  storage_name                              = "funcappexample2storagex" // update resource post classic authentication upgrade
  storage_account_tier                      = var.storage_account_tier
  storage_account_replication_type          = var.storage_account_replication_type
  storage_container_name                    = var.storage_container_name2
  storage_account_blob_container_sas_start  = var.storage_account_blob_container_sas_start
  storage_account_blob_container_sas_expiry = var.storage_account_blob_container_sas_expiry
  //auth_setting
  auth_settings_enabled         = var.func_auth_settings_enabled2
  auth_settings_version         = var.func_auth_settings_version
  auth_token_store_enabled      = var.func_token_store_enabled
  unauthenticated_client_action = var.func_app_unauthenticated_client_action
  default_identity_provider     = var.func_app_default_identity_provider
  identity_provider_client_id   = var.func_app_identity_provider_client_id
  identity_issuer               = var.func_app_identity_issuer
}

// insufficient permission to create app registration
module "app-registration-github" {
  source           = "./modules/terraform-azuread-application"
  ad_app_name      = "GitHub-test"
  sign_in_audience = "AzureADMyOrg"
  app_roles        = []
}

# module "sample-func-app-1-diagnostic-setting" {
#   source                     = "./modules/terraform-azurerm-monitor-diagnostic-setting"
#   name                       = var.diag_setting_name
#   target_resource_id         = module.sample-func-app-1.app_id
#   log_analytics_workspace_id = var.log_analytics_workspace_id
#   log_configs                = var.diag_log_configs_func_app
#   metrics_configs            = var.diag_metric_configs_func_app
# }

# module "postgresql-diagnostic-setting" {
#   source                     = "./modules/terraform-azurerm-monitor-diagnostic-setting"
#   name                       = var.diag_setting_name
#   target_resource_id         = "/subscriptions/c1649e11-82d7-47c6-865c-02eda7a1b2c1/resourceGroups/rg-infra-pae01-eastus01/providers/Microsoft.DBforPostgreSQL/servers/pgsql-toolchain-pae-eus"
#   log_analytics_workspace_id = var.log_analytics_workspace_id
#   log_configs                = var.diag_log_configs_postgres
#   metrics_configs            = var.diag_metric_configs_postgres
# }


# // "name": "logws-toolchain-pae-eus",
# data "azurerm_log_analytics_workspace" "example" {
#   name                = "logws-toolchain-pae-eus"
#   resource_group_name = "rg-infra-pae01-eastus01"
# }

# output "log_analytics_workspace_id" {
#   value = data.azurerm_log_analytics_workspace.example.workspace_id
# }

# output "function_app_id" {
#   value = module.sample-func-app-1.app_id
# }


// output
# output "function_app_id" {
#   value = module.sample-func-app-1.app_id
# }
# output "function_app_settings" {
#   value     = module.sample-func-app-1.app_settings
#   sensitive = true
# }
# output "function_auth_settings" {
#   value     = module.sample-func-app-1.auth_settings
#   sensitive = true
# }
# output "function_connection_string" {
#   value = module.sample-func-app-1.connection_string
# }

// output app registration
output "application_id" {
  value = module.app-registration-github.application_id
}
output "display_name" {
  value = module.app-registration-github.display_name
}
output "object_id" {
  value = module.app-registration-github.object_id
}
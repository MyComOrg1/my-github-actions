resource_group_name                         = "func-app-2-rs"
location                                    = "eastus"
storage_name                                = "ghfuncappstore2"
storage_account_tier                        = "Standard"
storage_account_replication_type            = "LRS"
allow_nested_items_to_be_public             = false
service_plan_name                           = "GitHubFuncApp2-sp"
funtion_app_name                            = "fGitHubFuncApp2"
storage_container_name                      = "httptrigger2-function-app"
storage_account_blob_container_sas_start    = "2022-09-01T00:00:00Z"
storage_account_blob_container_sas_expiry   = "2022-09-10T00:00:00Z"
sp_os_type                                  = "Linux"
sp_sku_name                                 = "Y1"
func_auth_settings_enabled                  = true
func_auth_settings_version                  = "~2"
func_token_store_enabled                    = true
func_app_unauthenticated_client_action      = "RedirectToLoginPage"
func_app_default_identity_provider          = "MicrosoftAccount"
func_app_identity_provider_client_id        = "528bd09f-b68b-49c8-9661-6c46ff01a2c1"
func_app_identity_issuer                    = "https://sts.windows.net/94a944a2-a2fb-4b59-abf4-fa11560a9845/v2.0"

//--------- sample-func-app-2 ---------
funtion_app_name2 = "gitHubFuncApp-example2"
service_plan_name2 = "fGitHubFuncApp-example2-sp"
storage_name2 = "funcappexample2storage"
// Error: only lowercase alphanumeric characters and hyphens allowed in "name":
storage_container_name2 = "githubfuncapp-example2-container"
func_auth_settings_enabled2 = true


// diagnostic setting
diag_setting_name               = "diag setting sample"
log_analytics_workspace_id      = "/subscriptions/c1649e11-82d7-47c6-865c-02eda7a1b2c1/resourcegroups/rg-infra-pae01-eastus01/providers/microsoft.operationalinsights/workspaces/logws-toolchain-pae-eus"
diag_metric_configs_func_app = [{
    category                    = "AllMetrics",
    enabled                     = true,
    retention_policy_enabled    = false,
    retention_policy_days       = 0
  }]
diag_log_configs_func_app = [{
    category                    = "FunctionAppLogs",
    category_group              = null
    enabled                     = true,
    retention_policy_enabled    = false,
    retention_policy_days       = 0
  }]
diag_metric_configs_postgres = [{
    category                    = "AllMetrics",
    enabled                     = false,
    retention_policy_enabled    = false,
    retention_policy_days       = 0
  }]
diag_log_configs_postgres = [{
    category                    = null,
    category_group              = "AllLogs",
    enabled                     = true,
    retention_policy_enabled    = false,
    retention_policy_days       = 0
  }]
  
resource "azurerm_monitor_diagnostic_setting" "diag-setting" {
  name               = var.name
  target_resource_id = var.target_resource_id

  // must configure at least one of the 3 below
  storage_account_id = var.storage_account_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id

  // note:
  // This setting will only have an effect if a log_analytics_workspace_id is provided,
  // and the resource is available for resource-specific logs
  log_analytics_destination_type = var.log_analytics_destination_type

  dynamic "log" {
    for_each    = var.log_configs
    iterator    = config
    content {
        category = config.value.category
        // terraform validation:  An argument named "category_group" is not expected here.
        // azure: 
        //        - Not all resources have category groups available.
        //        - Currently, there are two category groups:
        //          - All: Every resource log offered by the resource.
        //          - Audit: All resource logs that record customer interactions with data or the settings of the service.
        category_group = config.value.category_group
        enabled  = config.value.enabled

        # only applied to storage account
        retention_policy {
            enabled = config.value.retention_policy_enabled
            days = config.value.retention_policy_days
        }
    }
  }

  dynamic "metric" {
    for_each    = var.metrics_configs
    iterator    = config
    content {
        category = config.value.category
        enabled  = config.value.enabled

        # only applied to storage account
        retention_policy {
            enabled = config.value.retention_policy_enabled
            days = config.value.retention_policy_days
        }
    }
  }

}
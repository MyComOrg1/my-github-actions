variable "name" {
    type        = string
    description = "Name of the monitor diagnostic setting"
}
variable "target_resource_id" {
    type        = string
    description = "Id of the resource on which to configure Diagnostic Settings."
}
variable "storage_account_id" {
    type        = string
    description = ""
    default     = null
}
//todo: can we validation below?
// One of the following must be configured: log_analytics_workspace_id, storage_account_id or eventhub_authorization_rule_id"
variable "log_analytics_workspace_id" {
    type        = string
    description = "eventhub_authorization_rule_id"
    default     = null
}

variable "eventhub_authorization_rule_id" {
    type        = string
    description = ""
    default     = null
}
variable "log_analytics_destination_type" {
    type        = string
    description = ""
    default = null
}
variable "log_configs" {
  type = list(object({
    category                    = string
    category_group              = string
    enabled                     = bool
    retention_policy_enabled    = bool
    retention_policy_days       = number
  }))

  default = [{
    category                    = "",
    category_group              = null,
    enabled                     = false,
    retention_policy_enabled    = false,
    retention_policy_days       = 0
  }]
}
variable "metrics_configs" {
  type = list(object({
    category                    = string
    enabled                     = bool
    retention_policy_enabled    = bool
    retention_policy_days       = number
  }))

  default = [{
    category                    = "AllMetrics",
    enabled                     = true,
    retention_policy_enabled    = false,
    retention_policy_days       = 0
  }]
}
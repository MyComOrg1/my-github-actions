output "id" {
    value       = azurerm_monitor_diagnostic_setting.diag-setting.id
    description = "The monitor diagnostic setting id"
}

output "log" {
  value       = azurerm_monitor_diagnostic_setting.diag-setting.log
  description = "List of Log Categories supported for this monitor diagnostic setting"
}

// │ This object has no argument, nested block, or exported attribute named
// │ "log_category_types".
# output "log_category_types" {
#   value       = azurerm_monitor_diagnostic_setting.diag-setting.log_category_types
#   description = "List of supported log category types for this monitor diagnostic setting"
# }

output "metric" {
  value       = azurerm_monitor_diagnostic_setting.diag-setting.metric
  description = "List of Metric Categories supported for this monitor diagnostic setting"
}
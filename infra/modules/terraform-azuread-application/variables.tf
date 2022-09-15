variable "ad_app_name" {
  type = string
  description = "Display name for AD application"
}

variable "sign_in_audience" {
  type = string
  description = "Display name for AD application"
  default = "AzureADMyOrg"
  
  validation {
    condition = contains([
        "AzureADMyOrg",
        "AzureADMultipleOrgs",
        "AzureADandPersonalMicrosoftAccount",
        "PersonalMicrosoftAccount"
    ], var.sign_in_audience)
    error_message = "Must be one of AzureADMyOrg, AzureADMultipleOrgs, AzureADandPersonalMicrosoftAccount or PersonalMicrosoftAccount. Defaults to AzureADMyOrg."
  }
}

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

variable "app_roles" {
  type = list(object({
    allowed_member_types    = list // options: User, Application
    description             = string
    display_name            = bool
    enabled                 = bool
    value                   = string
  }))

  // todo: default to empty?
  default = [{
    allowed_member_types    = ["Application"] // options: User, Application
    description             = ""
    display_name            = ""
    enabled                 = true
    value                   = ""
  }]
}

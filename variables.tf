variable "cdn_frontdoor_firewall_policies" {
  description = <<EOT
Map of cdn_frontdoor_firewall_policies, attributes below
Required:
    - mode
    - name
    - resource_group_name
    - sku_name
Optional:
    - captcha_cookie_expiration_in_minutes
    - custom_block_response_body
    - custom_block_response_status_code
    - enabled
    - js_challenge_cookie_expiration_in_minutes
    - redirect_url
    - request_body_check_enabled
    - tags
    - custom_rule (block):
        - action (required)
        - enabled (optional)
        - match_condition (optional, block):
            - match_values (required)
            - match_variable (required)
            - negation_condition (optional)
            - operator (required)
            - selector (optional)
            - transforms (optional)
        - name (required)
        - priority (optional)
        - rate_limit_duration_in_minutes (optional)
        - rate_limit_threshold (optional)
        - type (required)
    - log_scrubbing (block):
        - enabled (optional)
        - scrubbing_rule (required, block):
            - enabled (optional)
            - match_variable (required)
            - operator (optional)
            - selector (optional)
    - managed_rule (block):
        - action (required)
        - exclusion (optional, block):
            - match_variable (required)
            - operator (required)
            - selector (required)
        - override (optional, block):
            - exclusion (optional, block):
                - match_variable (required)
                - operator (required)
                - selector (required)
            - rule (optional, block):
                - action (required)
                - enabled (optional)
                - exclusion (optional, block):
                    - match_variable (required)
                    - operator (required)
                    - selector (required)
                - rule_id (required)
            - rule_group_name (required)
        - type (required)
        - version (required)
EOT

  type = map(object({
    mode                                      = string
    name                                      = string
    resource_group_name                       = string
    sku_name                                  = string
    captcha_cookie_expiration_in_minutes      = optional(number)
    custom_block_response_body                = optional(string)
    custom_block_response_status_code         = optional(number)
    enabled                                   = optional(bool)
    js_challenge_cookie_expiration_in_minutes = optional(number)
    redirect_url                              = optional(string)
    request_body_check_enabled                = optional(bool)
    tags                                      = optional(map(string))
    custom_rule = optional(list(object({
      action  = string
      enabled = optional(bool)
      match_condition = optional(list(object({
        match_values       = list(string)
        match_variable     = string
        negation_condition = optional(bool)
        operator           = string
        selector           = optional(string)
        transforms         = optional(list(string))
      })))
      name                           = string
      priority                       = optional(number)
      rate_limit_duration_in_minutes = optional(number)
      rate_limit_threshold           = optional(number)
      type                           = string
    })))
    log_scrubbing = optional(object({
      enabled = optional(bool)
      scrubbing_rule = list(object({
        enabled        = optional(bool)
        match_variable = string
        operator       = optional(string)
        selector       = optional(string)
      }))
    }))
    managed_rule = optional(list(object({
      action = string
      exclusion = optional(list(object({
        match_variable = string
        operator       = string
        selector       = string
      })))
      override = optional(list(object({
        exclusion = optional(list(object({
          match_variable = string
          operator       = string
          selector       = string
        })))
        rule = optional(list(object({
          action  = string
          enabled = optional(bool)
          exclusion = optional(list(object({
            match_variable = string
            operator       = string
            selector       = string
          })))
          rule_id = string
        })))
        rule_group_name = string
      })))
      type    = string
      version = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.custom_rule == null || (length(v.custom_rule) <= 100)
      )
    ])
    error_message = "Each custom_rule list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.custom_rule == null || alltrue([for item in v.custom_rule : (item.match_condition == null || (length(item.match_condition) <= 10))])
      )
    ])
    error_message = "Each match_condition list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.log_scrubbing == null || (length(v.log_scrubbing.scrubbing_rule) >= 1 && length(v.log_scrubbing.scrubbing_rule) <= 100)
      )
    ])
    error_message = "Each scrubbing_rule list must contain between 1 and 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || (length(v.managed_rule) <= 100)
      )
    ])
    error_message = "Each managed_rule list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.exclusion == null || (length(item.exclusion) <= 100))])
      )
    ])
    error_message = "Each exclusion list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.override == null || (length(item.override) <= 100))])
      )
    ])
    error_message = "Each override list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.override == null || alltrue([for item in item.override : (item.exclusion == null || (length(item.exclusion) <= 100))]))])
      )
    ])
    error_message = "Each exclusion list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.override == null || alltrue([for item in item.override : (item.rule == null || (length(item.rule) <= 1000))]))])
      )
    ])
    error_message = "Each rule list must contain at most 1000 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.override == null || alltrue([for item in item.override : (item.rule == null || alltrue([for item in item.rule : (item.exclusion == null || (length(item.exclusion) <= 100))]))]))])
      )
    ])
    error_message = "Each exclusion list must contain at most 100 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.js_challenge_cookie_expiration_in_minutes == null || (v.js_challenge_cookie_expiration_in_minutes >= 5 && v.js_challenge_cookie_expiration_in_minutes <= 1440)
      )
    ])
    error_message = "must be between 5 and 1440"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.captcha_cookie_expiration_in_minutes == null || (v.captcha_cookie_expiration_in_minutes >= 5 && v.captcha_cookie_expiration_in_minutes <= 1440)
      )
    ])
    error_message = "must be between 5 and 1440"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.custom_block_response_status_code == null || (contains([200, 403, 405, 406, 429, 990, 991, 992, 993, 994, 995, 996, 997, 998, 999], v.custom_block_response_status_code))
      )
    ])
    error_message = "must be one of: 200, 403, 405, 406, 429, 990, 991, 992, 993, 994, 995, 996, 997, 998, 999"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.custom_block_response_body == null || (can(base64decode(v.custom_block_response_body)))
      )
    ])
    error_message = "must be valid base64"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.custom_rule == null || alltrue([for item in v.custom_rule : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.custom_rule == null || alltrue([for item in v.custom_rule : (item.match_condition == null || alltrue([for item in item.match_condition : (alltrue([for x in item.match_values : length(x) >= 1 && length(x) <= 256]))]))])
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.custom_rule == null || alltrue([for item in v.custom_rule : (item.match_condition == null || alltrue([for item in item.match_condition : (item.selector == null || (length(item.selector) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (length(item.type) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (length(item.version) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.exclusion == null || alltrue([for item in item.exclusion : (length(item.selector) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.override == null || alltrue([for item in item.override : (length(item.rule_group_name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.override == null || alltrue([for item in item.override : (item.exclusion == null || alltrue([for item in item.exclusion : (length(item.selector) > 0)]))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.override == null || alltrue([for item in item.override : (item.rule == null || alltrue([for item in item.rule : (length(item.rule_id) > 0)]))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.managed_rule == null || alltrue([for item in v.managed_rule : (item.override == null || alltrue([for item in item.override : (item.rule == null || alltrue([for item in item.rule : (item.exclusion == null || alltrue([for item in item.exclusion : (length(item.selector) > 0)]))]))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.log_scrubbing == null || (alltrue([for item in v.log_scrubbing.scrubbing_rule : (item.selector == null || (length(item.selector) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_frontdoor_firewall_policies : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 23 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


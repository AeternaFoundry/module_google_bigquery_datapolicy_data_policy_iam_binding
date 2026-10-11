variable "bigquery_datapolicy_data_policy_iam_bindings" {
  description = <<EOT
Map of bigquery_datapolicy_data_policy_iam_bindings, attributes below
Required:
    - data_policy_id
    - members
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    data_policy_id = string
    members        = set(string)
    role           = string
    location       = optional(string)
    project        = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}


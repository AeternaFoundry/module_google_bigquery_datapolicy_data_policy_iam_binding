resource "google_bigquery_datapolicy_data_policy_iam_binding" "bigquery_datapolicy_data_policy_iam_bindings" {
  for_each = var.bigquery_datapolicy_data_policy_iam_bindings

  data_policy_id = each.value.data_policy_id
  members        = each.value.members
  role           = each.value.role
  location       = each.value.location
  project        = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}


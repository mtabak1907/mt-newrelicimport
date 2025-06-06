terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.62.0"
    }
  }
}

provider "newrelic" {
  account_id = 2547913
  api_key    = var.newrelic_api_key
  region     = "US"
}

variable "newrelic_api_key" {
  type      = string
  sensitive = true
}

resource "newrelic_alert_policy" "inet" {
  name                = "iNet Alert Policy (ccab-cld)"
  incident_preference = "PER_CONDITION"
}

resource "newrelic_nrql_alert_condition" "inet_task_manager_stopped_checkpointing_ccabcld" {
  policy_id = newrelic_alert_policy.inet.id
  name      = "iNet Task Manager Stopped Checkpointing (ccab-cld)"
  type      = "static"
  enabled   = true

  nrql {
    query = "REPLACE_WITH_QUERY"
  }

  critical {
    threshold             = 90
    threshold_duration    = 300
    threshold_occurrences = "ALL"
    operator              = "above"
  }

  aggregation_window           = 60
  aggregation_method           = "event_flow"
  aggregation_delay            = 120
  violation_time_limit_seconds = 259200

  lifecycle {
    ignore_changes = [
      nrql,
      critical,
      warning,
      aggregation_method,
      aggregation_delay,
      expiration_duration,
      open_violation_on_expiration,
      close_violations_on_expiration,
      ignore_on_expected_termination
    ]
  }
}

resource "newrelic_nrql_alert_condition" "inet_job_manager_error_ccabcld" {
  policy_id = newrelic_alert_policy.inet.id
  name      = "iNet Job Manager Error (ccab-cld)"
  type      = "static"
  enabled   = true

  nrql {
    query = "REPLACE_WITH_QUERY"
  }

  critical {
    threshold             = 90
    threshold_duration    = 300
    threshold_occurrences = "ALL"
    operator              = "above"
  }

  aggregation_window           = 60
  aggregation_method           = "event_flow"
  aggregation_delay            = 120
  violation_time_limit_seconds = 259200

  lifecycle {
    ignore_changes = [
      nrql,
      critical,
      warning,
      aggregation_method,
      aggregation_delay,
      expiration_duration,
      open_violation_on_expiration,
      close_violations_on_expiration,
      ignore_on_expected_termination
    ]
  }
}

resource "newrelic_nrql_alert_condition" "inet_health_probe_error_ccabcld" {
  policy_id = newrelic_alert_policy.inet.id
  name      = "iNet Health Probe Error (ccab-cld)"
  type      = "static"
  enabled   = true

  nrql {
    query = "REPLACE_WITH_QUERY"
  }

  critical {
    threshold             = 90
    threshold_duration    = 300
    threshold_occurrences = "ALL"
    operator              = "above"
  }

  aggregation_window           = 60
  aggregation_method           = "event_flow"
  aggregation_delay            = 120
  violation_time_limit_seconds = 259200

  lifecycle {
    ignore_changes = [
      nrql,
      critical,
      warning,
      aggregation_method,
      aggregation_delay,
      expiration_duration,
      open_violation_on_expiration,
      close_violations_on_expiration,
      ignore_on_expected_termination
    ]
  }
}

resource "newrelic_nrql_alert_condition" "inet_task_manager_error_ccabcld" {
  policy_id = newrelic_alert_policy.inet.id
  name      = "iNet Task Manager Error (ccab-cld)"
  type      = "static"
  enabled   = true

  nrql {
    query = "REPLACE_WITH_QUERY"
  }

  critical {
    threshold             = 90
    threshold_duration    = 300
    threshold_occurrences = "ALL"
    operator              = "above"
  }

  aggregation_window           = 60
  aggregation_method           = "event_flow"
  aggregation_delay            = 120
  violation_time_limit_seconds = 259200

  lifecycle {
    ignore_changes = [
      nrql,
      critical,
      warning,
      aggregation_method,
      aggregation_delay,
      expiration_duration,
      open_violation_on_expiration,
      close_violations_on_expiration,
      ignore_on_expected_termination
    ]
  }
}

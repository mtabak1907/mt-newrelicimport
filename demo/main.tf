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



resource "newrelic_alert_policy" "existing" {
  name = "MT-DEMO-ENV"
}




resource "newrelic_nrql_alert_condition" "mtdemoenvcpu" {
  policy_id = newrelic_alert_policy.existing.id
  name      = "MT-DEMO-ENV-CPU"
  type      = "static"
  enabled   = false

  nrql {
    query = "REPLACE_WITH_QUERY"
  }

  critical {
    threshold             = 90
    threshold_duration    = 120
    threshold_occurrences = "ALL"
    operator              = "above"
  }

  aggregation_window           = 60
  aggregation_method           = "event_flow"
  violation_time_limit_seconds = 259200


  lifecycle {
    ignore_changes = [
      nrql,
      
      warning

    ]
  }
}

resource "newrelic_nrql_alert_condition" "mtserver_restart" {
  policy_id = newrelic_alert_policy.existing.id
  name      = "mt-server restart"
  type      = "static"
  enabled   = true

  nrql {
    query = "REPLACE_WITH_QUERY"
  }

  critical {
    threshold             = 90
    threshold_duration    = 301
    threshold_occurrences = "ALL"
    operator              = "above"
  }

  aggregation_window           = 60
  aggregation_method           = "event_flow"
  violation_time_limit_seconds = 259200


  lifecycle {
    ignore_changes = [
      nrql,
      critical,
      warning

    ]
  }
}

resource "newrelic_nrql_alert_condition" "mtmonhon" {
  policy_id = newrelic_alert_policy.existing.id
  name      = "MT-MONHON"
  type      = "static"
  enabled   = true

  nrql {
    query = "REPLACE_WITH_QUERY"
  }

  critical {
    threshold             = 90
    threshold_duration    = 309
    threshold_occurrences = "ALL"
    operator              = "above"
  }

  aggregation_window           = 60
  aggregation_method           = "event_flow"
  violation_time_limit_seconds = 259200


  lifecycle {
    ignore_changes = [
      nrql,
      critical,
      warning

    ]
  }
}

resource "newrelic_nrql_alert_condition" "mttrho" {
  policy_id = newrelic_alert_policy.existing.id
  name      = "MT-TRHO"
  type      = "static"
  enabled   = false

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
  violation_time_limit_seconds = 259200


  lifecycle {
    ignore_changes = [
      nrql,
      critical,
      warning

    ]
  }
}

resource "newrelic_nrql_alert_condition" "mttra" {
  policy_id = newrelic_alert_policy.existing.id
  name      = "MT-TRA"
  type      = "static"
  enabled   = false

  nrql {
    query = "select count(*) from Transaction"
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
      warning

    ]
  }
}


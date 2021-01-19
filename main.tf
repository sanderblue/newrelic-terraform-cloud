# Terraform config for v0.13+
terraform {
  required_version = "~> 0.13.0"

  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
      version = "~> 2.15"
    }
  }
}

# Configured using environment variables
provider "newrelic" {}

data "newrelic_entity" "example_app" {
  name = "Dummy App" # Must be an exact match to your application name in New Relic
  domain = "APM" # or BROWSER, INFRA, MOBILE, SYNTH, depending on your entity's domain
  type = "APPLICATION"
}

resource "newrelic_alert_policy" "golden_signal_policy" {
  name = "Golden Signals Terraform Cloud POC - ${data.newrelic_entity.example_app.name}"
}

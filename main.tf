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

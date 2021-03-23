# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  type        = string
  description = "The AWS region to deploy into (e.g. us-east-1)."
  default     = "us-east-1"
}

variable "production_bucket_name" {
  type        = string
  description = "The name of the S3 bucket where the production Tanium system packages live."
  default     = "cisa-cool-third-party-production"
}

variable "production_objects" {
  type        = list(string)
  description = "The Tanium system package objects inside the production bucket."
  default = [
    "RPM-GPG-KEY-Tanium",
    "tanium-init.dat",
    "TaniumClient-*",
    "taniumclient_*",
  ]
}

variable "staging_bucket_name" {
  type        = string
  description = "The name of the S3 bucket where the staging Tanium system packages live."
  default     = "cisa-cool-third-party-staging"
}

variable "staging_objects" {
  type        = list(string)
  description = "The Tanium system packages inside the staging bucket."
  default = [
    "RPM-GPG-KEY-Tanium",
    "tanium-init.dat",
    "TaniumClient-*",
    "taniumclient_*",
  ]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"

  default = {
    Team        = "VM Fusion - Development"
    Application = "ansible-role-cdm-tanium-client testing"
  }
}

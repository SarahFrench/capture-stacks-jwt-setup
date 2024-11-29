# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "< 0.58.0" # avoids a bug in v0.58.0
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 6.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

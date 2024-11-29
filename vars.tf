# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# This must match the audience value in the identity token block
# For example, see: https://github.com/liamcervante/capture-stacks-jwt/blob/e5ee71ad2c3b51a3a65b6977ed7a11207a1f6792/main.tfdeploy.hcl#L3
variable "tfc_audience" {
  type        = string
  default     = "hcp.workload.identity"
  description = "The audience value to use in run identity tokens"
}

variable "tfc_hostname" {
  type        = string
  default     = "app.terraform.io"
  description = "The hostname of the TFC or TFE instance you'd like to use with AWS"
}

variable "tfc_organization_name" {
  type        = string
  description = "The name of your Terraform Cloud organization"
}

variable "tfc_project_name" {
  type        = string
  description = "The project under which a stack will be created"
}

# Note - this value impacts the length of the assertion.sub, which needs to be <=127 bytes
# So, choose short names
variable "tfc_stack_name" {
  type        = string
  description = "The name of the stack to create"
  default     = "get-jwts"
}

variable "tfc_stack_deployment" {
  type        = string
  description = "Name of the stack deployment"
  default     = "demo"
}

variable "github_token" {
  type      = string
  sensitive = true
}

# Fork https://github.com/liamcervante/capture-stacks-jwt and change this value to your forked repo
variable "github_repo_identifier" {
  type    = string
  default = "SarahFrench/capture-stacks-jwt"
}

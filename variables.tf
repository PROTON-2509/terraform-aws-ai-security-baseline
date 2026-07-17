variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "app_name" {
  description = "Application name used for naming resources"
  type        = string
}

variable "workload_actions" {
  description = "Allowed actions for the AI workload permission boundary"
  type        = list(string)
}
/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  Projects for log sinks
*****************************************/

module "org_audit_logs" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 7.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "depriviledge"
  name                        = "org-audit-logs"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.logs.id
  activate_apis               = ["logging.googleapis.com", "bigquery.googleapis.com"]

  labels = {
    environment      = "prod"
    application_name = "org-audit-logs"
  }
}

module "org_billing_logs" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 7.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  default_service_account     = "depriviledge"
  name                        = "org-billing-logs"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.logs.id
  activate_apis               = ["logging.googleapis.com", "bigquery.googleapis.com"]

  labels = {
    environment      = "prod"
    application_name = "org-billing-logs"
  }
}

/******************************************
  Projects for monitoring workspaces
*****************************************/

module "org_monitoring_nonprod" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 7.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  name                        = "org-monitoring-nonprod"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.monitoring.id
  activate_apis               = ["logging.googleapis.com", "monitoring.googleapis.com"]

  labels = {
    environment      = "prod"
    application_name = "org-monitoring-nonprod"
  }
}

module "org_monitoring_prod" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 7.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  name                        = "org-monitoring-prod"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.monitoring.id
  activate_apis               = ["logging.googleapis.com", "monitoring.googleapis.com"]

  labels = {
    environment      = "prod"
    application_name = "org-monitoring-prod"
  }
}

/******************************************
  Projects for Shared VPCs
*****************************************/

module "org_shared_vpc_nonprod" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 7.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  name                        = "org-shared-vpc-nonprod"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.networking.id
  activate_apis = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "logging.googleapis.com"
  ]

  labels = {
    environment      = "prod"
    application_name = "org-shared-vpc-nonprod"
  }
}

module "org_shared_vpc_prod" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 7.0"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  name                        = "org-shared-vpc-prod"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.networking.id
  activate_apis = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "servicenetworking.googleapis.com",
    "container.googleapis.com",
    "logging.googleapis.com"
  ]

  labels = {
    environment      = "prod"
    application_name = "org-shared-vpc-prod"
  }
}

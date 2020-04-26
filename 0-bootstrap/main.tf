provider "google" {
  version = "~> 3.12.0"
}

provider "google-beta" {
  version = "~> 3.12.0"
}

provider "null" {
  version = "~> 2.1"
}

provider "random" {
  version = "~> 2.2"
}

/*************************************************
  Bootstrap GCP Organization.
*************************************************/

module "seed_bootstrap" {
  source                  = "terraform-google-modules/bootstrap/google"
  version                 = "~> 1.0"
  project_prefix = "gcp-foundation"
  org_id                  = var.org_id
  billing_account         = var.billing_account
  group_org_admins        = var.group_org_admins
  group_billing_admins    = var.group_billing_admins
  default_region          = var.default_region
  org_project_creators = ["group:team@dataminded.be"]
  sa_enable_impersonation = true
}

module "cloudbuild_bootstrap" {
  source                  = "terraform-google-modules/bootstrap/google//modules/cloudbuild"
  version                 = "~> 1.0"
  project_prefix 	      = "gcp-foundation"
  org_id                  = var.org_id
  billing_account         = var.billing_account
  group_org_admins        = var.group_org_admins
  default_region          = var.default_region
  terraform_sa_email      = module.seed_bootstrap.terraform_sa_email
  terraform_sa_name       = module.seed_bootstrap.terraform_sa_name
  terraform_state_bucket  = module.seed_bootstrap.gcs_bucket_tfstate
  sa_enable_impersonation = true
}

/*************************************************
  Additional super user setting
*************************************************/

//locals {
//
//  // we trust our engineers to act in the best interest, hence they each get a sandbox project
//  // in which they are project owner. Any API that they want enabled can be enabled here or in their own project
//  sudo_engineers = [
//	"kris.peeters",
//	"pascal.knapen",
//  ]
//
//  sudo_engineer_emails = formatlist("%s@dataminded.be", local.sudo_engineers)
//
//
//}
//
//resource "google_organization_iam_binding" "creator_binding" {
//  org_id = var.org_id
//  role    = "roles/resourcemanager.projectCreator"
//  members = formatlist("user:%s", local.sudo_engineer_emails)
//}


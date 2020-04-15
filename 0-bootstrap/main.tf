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
  sa_enable_impersonation = true
}

module "cloudbuild_bootstrap" {
  source                  = "terraform-google-modules/bootstrap/google//modules/cloudbuild"
  version                 = "~> 1.0"
  org_id                  = var.org_id
  billing_account         = var.billing_account
  group_org_admins        = var.group_org_admins
  default_region          = var.default_region
  terraform_sa_email      = module.seed_bootstrap.terraform_sa_email
  terraform_sa_name       = module.seed_bootstrap.terraform_sa_name
  terraform_state_bucket  = module.seed_bootstrap.gcs_bucket_tfstate
  sa_enable_impersonation = true
}

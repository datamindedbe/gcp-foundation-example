terraform {
  backend "gcs" {
    bucket = "gcp-foundation-tfstate-be35"
    prefix = "terraform/bootstrap/state"
  }
}

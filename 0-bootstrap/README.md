# 0-bootstrap

The purpose of this step is to bootstrap a GCP organization, creating all the required resources & permissions to start using the Cloud Foundation Toolkit (CFT). This step also configures Cloud Build & Cloud Source Repos for foundations code in subsequent stages.

## Prerequisites

1. A GCP [Organization](https://cloud.google.com/resource-manager/docs/creating-managing-organization)
1. A GCP [Billing Account](https://cloud.google.com/billing/docs/how-to/manage-billing-account)
1. Cloud Identity / Gsuite groups for organization and billing admins
1. Membership in the `group_org_admins` group for user running terraform

Further details of permissions required and resources created, can be found in the bootstrap module [documentation.](https://github.com/terraform-google-modules/terraform-google-bootstrap)

## Usage

1. set GOOGLE_APPLICATION_CREDENTIALS env variable to run under your user (non service-account) credentials
    1. run `gcloud auth application-default-login`
    2. point GOOGLE_APPLICATION_CREDENTIALS env variable to `json` file created above
1. Change into 0-bootstrap folder
1. Copy tfvars by running `cp terraform.example.tfvars terraform.tfvars` and update `terraform.tfvars` with values from your environment.
1. Run `terraform init`
1. Run `terraform plan` and review output
1. Run `terraform apply`
1. Copy the backend by running `cp backend.tf.example backend.tf` and update `backend.tf` with your bucket from the apply step (The value from `terraform output gcs_bucket_tfstate`)
1. Re-run `terraform init` agree to copy state to gcs when prompted
    1. (Optional) Run `terraform apply` to verify state is configured correctly

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| billing\_account | The ID of the billing account to associate projects with. | string | n/a | yes |
| default\_region | Default region to create resources where applicable. | string | `"us-central1"` | no |
| group\_billing\_admins | Google Group for GCP Billing Administrators | string | n/a | yes |
| group\_org\_admins | Google Group for GCP Organization Administrators | string | n/a | yes |
| org\_id | GCP Organization ID | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cloudbuild\_project\_id | Project where CloudBuild configuration and terraform container image will reside. |
| csr\_repos | List of Cloud Source Repos created by the module, linked to Cloud Build triggers. |
| gcs\_bucket\_cloudbuild\_artifacts | Bucket used to store Cloud/Build artefacts in CloudBuild project. |
| gcs\_bucket\_tfstate | Bucket used for storing terraform state for foundations pipelines in seed project. |
| kms\_crypto\_key | KMS key created by the module. |
| kms\_keyring | KMS Keyring created by the module. |
| seed\_project\_id | Project where service accounts and core APIs will be enabled. |
| terraform\_sa\_email | Email for privileged service account for Terraform. |
| terraform\_sa\_name | Fully qualified name for privileged service account for Terraform. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

### Software

-   [gcloud sdk](https://cloud.google.com/sdk/install) >= 206.0.0
-   [Terraform](https://www.terraform.io/downloads.html) >= 0.12.6

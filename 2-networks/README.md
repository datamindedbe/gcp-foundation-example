# 2-networks

The purpose of this step is to setup shared VPCs with default DNS, NAT, Private Service networking and baseline firewall rules.

## Prerequisites

1. 0-bootstrap executed successfully.
1. 1-org executed successfully.

## Usage

### Setup to run via Cloud Build
1. Clone repo `gcloud source repos clone gcp-networks --project=YOUR_CLOUD_BUILD_PROJECT_ID`
1. Change freshly cloned repo and change to non master branch `git checkout -b plan`
1. Copy contents of foundation to new repo `cp ../terraform-example-foundation/2-networks/* .`
1. Rename terraform.example.tfvars to terraform.tfvars and update the file with values from your environment and bootstrap.
1. Rename backend.tf.example backend.tf and update with your bucket from bootstrap.
1. Commit changes with `git add .` and `git commit -m 'Your message'`
1. Push your non master branch to trigger a plan `git push --set-upstream origin plan`
    1. Review the plan output in your cloud build project https://console.cloud.google.com/cloud-build/builds?project=YOUR_CLOUD_BUILD_PROJECT_ID
1. Merge changes to master with `git checkout -b master` and `git push origin master`
    1. Review the apply output in your cloud build project https://console.cloud.google.com/cloud-build/builds?project=YOUR_CLOUD_BUILD_PROJECT_ID


### Run terraform locally
1. Change into 2-networks folder
1. Rename terraform.example.tfvars to terraform.tfvars and update the file with values from your environment and bootstrap.
1. Rename backend.tf.example backend.tf and update with your bucket from bootstrap.
1. Run `terraform init`
1. Run `terraform plan` and review output
1. Run `terraform apply`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| billing\_account | Billing account to attach to projects. | string | n/a | yes |
| default\_region | Default subnet region standard_shared_vpc currently only configures one region | string | n/a | yes |
| org\_id | Organization ID | string | n/a | yes |
| terraform\_service\_account | Service account email of the account to impersonate to run Terraform. | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nonprod\_host\_project\_id | The host project ID for nonprod |
| nonprod\_network\_name | The name of the VPC being created |
| nonprod\_network\_self\_link | The URI of the VPC being created |
| nonprod\_subnets\_ips | The IPs and CIDRs of the subnets being created |
| nonprod\_subnets\_names | The names of the subnets being created |
| nonprod\_subnets\_secondary\_ranges | The secondary ranges associated with these subnets |
| nonprod\_subnets\_self\_links | The self-links of subnets being created |
| prod\_host\_project\_id | The host project ID for prod |
| prod\_network\_name | The name of the VPC being created |
| prod\_network\_self\_link | The URI of the VPC being created |
| prod\_subnets\_ips | The IPs and CIDRs of the subnets being created |
| prod\_subnets\_names | The names of the subnets being created |
| prod\_subnets\_secondary\_ranges | The secondary ranges associated with these subnets |
| prod\_subnets\_self\_links | The self-links of subnets being created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

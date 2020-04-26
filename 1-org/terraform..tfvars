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

domains_to_allow = ["dataminded.be"]

billing_data_users = "gcp-billing-admins@dataminded.be" #TODO duplicate of `group_billing_admins` in universal

terraform_service_account = "org-terraform@gcp-foundation-seed-e042.iam.gserviceaccount.com"

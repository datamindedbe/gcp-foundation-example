# GCP foundation
Repo showing how the CFT modules can be composed to build a cloud foundation

## [0-bootstrap](./0-bootstrap/README.md)

## Setting up CI/CD

We rely on github actions instead of GCP cloud build. Therefore, we set up CICD there. It requires two things
- a GitHub token to post the plan results to a PR
- the  `account.json` secret containing the service account credentials

1. run `gcloud iam service-accounts keys create account.json --iam-account org-terraform@gcp-foundation-seed-e042.iam.gserviceaccount.com`
2. run `cat 'account.json' | base64`
3. set GOOGLE_CREDENTIALS secret to resulting value


Due to the fact that we need a service account with very broad permissions in the action, we cannot allow untrusted third parties to create PRs to this repo.
Else they may expose the SECRET value through creating a PR that exposes all ENV variables.
## Keeping our repo up-to-date to upstream

```bash
git remote add upstream https://github.com/terraform-google-modules/terraform-example-foundation
git checkout -b update-from-upstream
git fetch upstream
git merge upstream/master
#deal with conflicts
#commit
#push
#create PR
```

# GCP foundation
Repo showing how the CFT modules can be composed to build a cloud foundation

## [0-bootstrap](./0-bootstrap/README.md)

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

#!/usr/bin/env sh

set -euxo pipefail

terraform output -state terraform-in/terraform.tfstate | tee terraform-outputs/terraform.tfvars

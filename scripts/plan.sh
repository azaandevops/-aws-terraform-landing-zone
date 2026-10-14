#!/usr/bin/env bash
set -euo pipefail
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan

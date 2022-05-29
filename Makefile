.PHONY: *

HELP_TAB_WIDTH = 25

.DEFAULT_GOAL := help

check-dependency = $(if $(shell command -v $(1)),,$(error Make sure $(1) is installed))

plan: ## Create a terraform `plan` file for creating the EKS cluster
	@terraform plan -out plan

cluster: plan ## Create the EKS cluster as defined in the `plan` file
	@terraform apply plan

region = $(shell terraform output -raw region)
name = $(shell terraform output -raw name)

kubectl-cfg: ## Configure kubectl
	@aws eks --region $(region) update-kubeconfig --name $(name)

help:
	@$(foreach m,$(MAKEFILE_LIST),grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(m) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-$(HELP_TAB_WIDTH)s\033[0m %s\n", $$1, $$2}';)


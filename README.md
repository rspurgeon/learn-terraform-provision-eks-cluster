# Provision an EKS Cluster

This repo is a modified clone of the [Provision an EKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster), containing
Terraform configuration files to provision an EKS cluster on AWS. Use the `rjs` branch.

## Usage

* Work from the modified branch
`git checkout rjs`

* Plan
`make plan`

* Apply
If the plan looks good:
`make cluster`

* Configure
`make configuration`

# Overview
A terraform plan that spins up virtual machines on an ESXi host using vCenter. This repo is organized for the use case of spinning up and down VMs within their own unique terraform workspace with the goal to simplify onboarding and offloading of virtual machines.

The main use case of this repo surrounds spinning up Kubernetes virtual machines to be later configured by Ansible playbooks.



# Features
- uses the new [VMWare datasource](https://cloudinit.readthedocs.io/en/latest/topics/datasources/vmware.html) built into cloud-init version 21.3 and later
- manage multiple virtual machines with separate state files using terraform workspaces


# Quickstart
1. From the root directroy run `terraform init`
1. Create a terraform workspace for the terraform run using `terraform workspace new <some name>`
1. Run `terraform apply --var-file=<path/to/terraform.tfvars>`


# Create kubernetes vms
```
terraform init
terraform workspace new kubernetes
terraform apply --var-file=examples/kubernetes/terraform.tfvars
```

# Destroy kubernetes vms
```
terraform workspace select kubernetes
terraform destroy --var-file=examples/kubernetes/terraform.tfvars
```

# Destroy
```
terraform workspace select ubuntu
terraform destroy --var-file=examples/ubuntu/terraform.tfvars
```



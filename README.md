# tfVmwUbuntu

## Goal
Spin up x Ubuntu host (with a basic apache server) in vCenter from content library based on Terraform

## Prerequisites:
- Make sure terraform in installed in the orchestrator VM
- Make sure your orchestrator VM has Internet Access  
- Make sure VMware credential/details are configured as environment variable for Vcenter:
```
export TF_VAR_vsphere_username=******
export TF_VAR_vsphere_password=******
```
- Optionally, you can set the following environment variable, if set, this will be used as a password otherwise the password will be automatically generated:
```
export TF_VAR_ubuntu_password=******
```

## Environment:

Terraform Plan has/have been tested against:

### terraform

```
Terraform v1.0.6
on linux_amd64
+ provider registry.terraform.io/hashicorp/local v2.1.0
+ provider registry.terraform.io/hashicorp/null v3.1.0
+ provider registry.terraform.io/hashicorp/random v3.1.0
+ provider registry.terraform.io/hashicorp/template v2.2.0
+ provider registry.terraform.io/hashicorp/tls v3.1.0
+ provider registry.terraform.io/hashicorp/vsphere v2.0.2
```

### V-center/ESXi version:
```
vCSA - 7.0.0 Build 16749670
ESXi host - 7.0.0 Build 16324942
```

## Input/Parameters:
- All the variables are stored in variables.tf
- variables.tf is an example for DHCP
  - if dhcp is enabled (var.dhcp is true), amount of VM(s) is defined is var.ubuntu.count
- variables.tf.static is an example for static IP
  - if dhcp is disabled (var.dhcp is false), amount of VM(s) is defined by the amount of IPs in var.ubuntu_ip4_addresses (["10.206.112.56/22", "10.206.112.57/22"])

## Run the terraform plan:
```
git clone https://github.com/tacobayle/tfVmwUbuntu ; cd tfVmwUbuntu ; terraform init ; terraform apply -auto-approve
```

## Outputs:
- IP(s) of the VM (dhcp or static)
- Ssh username of the VM
- Ssh password
- Ssh private key file path
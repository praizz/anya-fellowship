# Setting up Polkadot nodes with Terraform and Ansible

# Description

This repo specifically spins up multiple instances of polkadot nodes specifically collator nodes, boot nodes and rpc nodes. Terraform is used to spin up the infrastructure for the nodes - networking, security etc, while the Ansible is used for configuring the already spun nodes

## Prerequisites
- Terraform
- AWS CLI configured
- Ansible
- Python 3
- Boto 3 (sudo pip3 install boto3)

## To run the Terraform script:

```
git clone the repository
$cd Task-4-polkadot-node
$cd Terraform

terraform init
terraform plan
terraform apply
```
This spins up the infrastructure on AWS
It also creates an AWS IAM role named `dynamic_inventory_role` that would be assumed when dealing with ansibles dynamic inventory below

## To run the Ansible script:
Ansible was implemmted using dynamic inventories, the first step is to assume the IAM role that has full access to EC2
``
You can verify the role by running
``

With that, we can go ahead to run our configurations
```
$cd Ansible
$ansible-playbook rpcnode-playbook.yaml
$ansible-playbook bootnode-playbook.yaml
$ansible-playbook collatornode-playbook.yaml
```





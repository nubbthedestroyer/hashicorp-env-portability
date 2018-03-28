terraform init
terraform fmt
terraform validate -var-file aws.tfvars
terraform plan -var-file aws.tfvars
terraform apply -auto-approve -var-file aws.tfvars

set -e

terraform init
terraform fmt
terraform validate -var-file env.tfvars -var "nomad_ip=$NOMAD_IP" -var "consul_ip=$CONSUL_IP" -var "vagrant_ip=$VAGRANT_IP"
terraform plan -var-file env.tfvars -var "nomad_ip=$NOMAD_IP" -var "consul_ip=$CONSUL_IP" -var "vagrant_ip=$VAGRANT_IP"
terraform apply -auto-approve -var-file env.tfvars -var "nomad_ip=$NOMAD_IP" -var "consul_ip=$CONSUL_IP" -var "vagrant_ip=$VAGRANT_IP"

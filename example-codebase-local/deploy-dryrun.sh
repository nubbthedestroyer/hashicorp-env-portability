set -e

CONSUL_IP=`./get-consul-ip.sh`
NOMAD_IP=`./get-nomad-ip.sh`

terraform init
terraform fmt
terraform validate -var-file env.tfvars -var "nomad_ip=$NOMAD_IP" -var "consul_ip=$CONSUL_IP" -var "vagrant_ip=$VAGRANT_IP"
terraform plan -var-file env.tfvars -var "nomad_ip=$NOMAD_IP" -var "consul_ip=$CONSUL_IP" -var "vagrant_ip=$VAGRANT_IP"

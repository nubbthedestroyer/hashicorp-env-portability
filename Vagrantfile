# -*- mode: ruby -*-
# vi: set ft=ruby :

env_var_access_key = ""
if ENV['AWS_ACCESS_KEY_ID']
  value = ENV['AWS_ACCESS_KEY_ID']
  env_var_access_key = <<CMD
echo "export AWS_ACCESS_KEY_ID=#{value}" | tee -a /home/vagrant/.profile
CMD
end

env_var_secret_key = ""
if ENV['AWS_SECRET_ACCESS_KEY']
  value = ENV['AWS_SECRET_ACCESS_KEY']
  env_var_secret_key = <<CMD
echo "export AWS_SECRET_ACCESS_KEY=#{value}" | tee -a /home/vagrant/.profile
CMD
end

env_var_region = ""
if ENV['AWS_DEFAULT_REGION']
  value = ENV['AWS_DEFAULT_REGION']
  env_var_region = <<CMD
echo "export AWS_DEFAULT_REGION=#{value}" | tee -a /home/vagrant/.profile
CMD
end

# env_var_vagrant_ip = <<CMD
# echo "export VAGRANT_IP="$(ip address show enp0s8 | grep 'inet ' | sed -e 's/^.*inet //' -e 's/\/.*$//')"" | tee -a /home/vagrant/.profile
# CMD

script = <<SCRIPT
#{env_var_secret_key}
#{env_var_access_key}
#{env_var_region}
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.network "public_network"

  config.vm.provision :shell, :inline => script

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y wget htop vim unzip python-pip docker.io nginx jq
    pip install --upgrade pip
    pip install awscli

    rm -rf /hashicorp

    git clone --branch master https://github.com/hashicorp/terraform-aws-consul.git /hashicorp/terraform-aws-consul/
    git clone --branch master https://github.com/hashicorp/terraform-aws-nomad.git /hashicorp/terraform-aws-nomad/

    rm -rf /usr/local/bin/packer
    rm -rf /usr/local/bin/terraform
    rm -rf /usr/local/bin/nomad
    rm -rf /usr/local/bin/consul
    rm -rf *.zip

    wget -q https://releases.hashicorp.com/terraform/0.11.5/terraform_0.11.5_linux_amd64.zip
    unzip terraform*.zip
    mv terraform /usr/local/bin/

    wget -q https://releases.hashicorp.com/nomad/0.7.1/nomad_0.7.1_linux_amd64.zip
    unzip nomad*.zip
    mv nomad /usr/local/bin/

    wget -q https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip
    unzip consul*.zip
    mv consul /usr/local/bin/

    wget -q https://releases.hashicorp.com/packer/1.2.2/packer_1.2.2_linux_amd64.zip
    unzip packer*.zip
    mv packer /usr/local/bin/

    sudo /vagrant/setup-nginx.sh &> /dev/null
    # sudo /vagrant/run-nomad-consul.sh
    sudo /vagrant/set-vagrant-ip.sh

  SHELL
end

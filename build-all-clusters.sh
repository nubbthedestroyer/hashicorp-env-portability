#!/bin/sh

set -e

./run-nomad-consul.sh
./setup-nginx.sh

cd infra-aws/modules/nomad-consul-ami
rm -rf build.log
packer build -machine-readable nomad-consul-docker.json | tee build.log
echo "ami_id = \"$(grep 'artifact,0,id' build.log | grep 'ubuntu' | cut -d, -f6 | cut -d: -f2)\"" > ../../aws.tfvars

cd ../..
pwd
ls -lah
./build-aws-cluster.sh

echo "Waiting 2 mins while AWS nodes finish bootstrapping..."
sleep 120
cd ../example-codebase-cluster
./deploy.sh
cd ../example-codebase-local
./deploy.sh
cd ..

echo "Wait for 30 seconds while the services register."
sleep 30
./get-addresses.sh

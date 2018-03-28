set -e

CONSUL_IP=`./get-consul-ip.sh`
NOMAD_IP=`./get-nomad-ip.sh`

echo
echo "Go check out your AWS application:"
echo
echo "Consul Endpoint = http://${CONSUL_IP}:8500/ui/"
echo "Nomad Endpoint = http://${NOMAD_IP}:4646/"
echo
for n in $(dig @${CONSUL_IP} +short -p 8600 http-echo-1.service.us-east-1.consul); do
  echo "Hello World 1: = http://`./get-nomad-worker-ip.sh ${n}`:8080/"
done
echo
for n in $(dig @${CONSUL_IP} +short -p 8600 http-echo-2.service.us-east-1.consul); do
  echo "Hello World 2: = http://`./get-nomad-worker-ip.sh ${n}`:8082/"
done
echo
echo
echo "Go check out your application running locally in vagrant at the following endpoints:"
echo
echo "Consul Endpoint = http://${VAGRANT_IP}:8500/ui/"
echo "Nomad Endpoint = http://${VAGRANT_IP}:4646/"
echo "Hello World 1 = http://${VAGRANT_IP}:8080/"
echo "Hello World 2 = http://${VAGRANT_IP}:8082/"
echo

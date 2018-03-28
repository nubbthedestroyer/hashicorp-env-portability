
echo "[LOG]   Killing any running services..."
sudo pkill -2 nomad
sudo pkill -2 consul

echo "[LOG]   Starting Consul..."
sudo screen -dmSL consul consul agent -ui -server -bootstrap-expect=1 -node=agent-one -bind=${VAGRANT_IP} -client=0.0.0.0 -data-dir=/tmp/consuldata

echo "[LOG]   Starting Nomad..."
sudo screen -dmSL nomad nomad agent -dev -bind=${VAGRANT_IP}

echo "export VAGRANT_IP="$(ip address show enp0s8 | grep 'inet ' | sed -e 's/^.*inet //' -e 's/\/.*$//')"" | tee -a /home/vagrant/.profile

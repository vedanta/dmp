#!/bin/bash
# use this script to install a salt-call minion
sudo apt-get update
sudo apt-get install -y wget
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.3/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
sudo add-apt-repository  "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.3 xenial main"
sudo apt-get update
sudo apt-get install -y salt-common salt-minion
# sudo sed -i -e "s/#file_client: remote/file_client: local/g" /etc/salt/minion
# sudo salt-call -l info --pillar-root=/srv/salt/pillar grains.item ipv4
# use the following command to run highstates
# cd /srv/salt && sudo salt-call -l info --pillar-root=/srv/salt/pillar state.apply

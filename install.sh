#!/bin/bash
echo "ARE YOU SURE?!!?!"
read
cd
apt-get install git-core puppet -y
cd /etc/
rm -rf puppet
git clone https://vistik@github.com/vistik/puppet.git puppet
echo "now run:"
echo "puppet apply --modulepath /etc/puppet/modules /etc/puppet/manifests/site.pp"

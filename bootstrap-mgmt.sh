#!/usr/bin/env bash
cat >> /etc/hosts <<EOL
# vagrant environment nodes
10.0.15.20  mesos-master01
10.0.15.30  mesos-slave01
EOL

#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/ansible/* /home/ubuntu
chown -R ubuntu:ubuntu /home/ubuntu

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  mgmt
10.0.15.20  mesos-master01
10.0.15.30  mesos-slave01
EOL
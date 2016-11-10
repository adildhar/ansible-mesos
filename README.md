# ansible-mesos
Ansible Mesos Marathon Zookeeper Chronos Vagrant Ubuntu

Ansible playbook to build multi-node Apache Mesos clusters.

To increase the number of master and slave use the below config in Vagrantfile

```````
(1..2).each do |i|
      config.vm.define "node#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "node#{i}"
    # Configure the network ips
        node.vm.network :private_network, ip: "10.0.15.2#{i}"
`````````

Once you bring up the vagrant boxes ensure that you can login from mesos-master to mesos-slave with ssh. You may use the following command on mesos-master.
````
ssh-copy-id <vagrant>@<mesos-slave>
````
Vagrant.configure("2") do |config|
    # create ansible mgmt node
    config.vm.define :mgmt do |mgmt_config|
      mgmt_config.vm.box = "ubuntu/xenial64"
      mgmt_config.vm.hostname = "mgmt"
      mgmt_config.ssh.username = "ubuntu"
      mgmt_config.vm.network :private_network, ip: "10.0.15.10"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
    end
    # create mesos-master node
    config.vm.define :"mesos-master" do |mesos_config|
      mesos_config.vm.box = "ubuntu-xenial64-jdk8"
      mesos_config.vm.box_url = "file:///cygwin64/home/boxes/ubuntu-mesos/ubuntu-xenial64-jdk8"
      mesos_config.vm.hostname = "mesos-master01"
      mesos_config.ssh.username = "ubuntu"
      mesos_config.vm.network :private_network, ip: "10.0.15.20"
      # Configure the network port forwarding
      mesos_config.vm.network :forwarded_port,  guest: 5050,  host: 5050
      mesos_config.vm.network :forwarded_port,  guest: 8080,  host: 8080
      mesos_config.vm.provider "virtualbox" do |vb|
        vb.memory = "768"
      end
    end
    config.vm.define :"mesos-slave" do |slave_config|
      slave_config.vm.box = "ubuntu-xenial64-jdk8"
      slave_config.vm.box_url = "file:///cygwin64/home/boxes/ubuntu-mesos/ubuntu-xenial64-jdk8"
      slave_config.vm.hostname = "mesos-slave01"
      slave_config.ssh.username = "ubuntu"
      slave_config.vm.network :private_network, ip: "10.0.15.30"
      slave_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
    end
    config.vm.define :"cus-mesos" do |cus_config|
      cus_config.vm.box = "ubuntu/xenial64"
      cus_config.vm.hostname = "mesos-cus01"
      cus_config.vm.network :private_network, ip: "10.0.15.30"
      cus_config.vm.provider "virtualbox" do |vb|
        vb.memory = "1536"
      end
    end
end
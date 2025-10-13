
LOGIN="mkane"
SERVER_IP="192.168.56.110"
WORKER_IP="192.168.56.111"

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp-education/ubuntu-24-04"
  config.vm.box_version = "0.1.0"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  config.vm.define "#{LOGIN}S" do |server|
    server.vm.hostname = "#{LOGIN}S"
    server.vm.network "private_network", ip: SERVER_IP
  end

  config.vm.define "#{LOGIN}SW" do |worker|
    worker.vm.hostname = "#{LOGIN}SW"
    worker.vm.network "private_network", ip: WORKER_IP
  end

end

# -*- mode: ruby -*-
# # vi: set ft=ruby :
#
Vagrant.configure(2) do |config|
  config.vm.define "postgres" do |postgres|
    postgres.vm.box = "ubuntu/trusty64"
    postgres.vm.network "forwarded_port", guest: 22, host: 2202, id: "ssh" # SSH
    postgres.vm.network "forwarded_port", guest: 5432, host: 5432 # PostgreSQL
    postgres.vm.provision "shell", path: "postgres.sh"
  end
end

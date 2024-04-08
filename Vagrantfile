# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.env.enable
  config.vm.box = "ubuntu/jammy64"
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.provision "file", source: ".env", destination: "/home/vagrant/.env"
  config.vm.provision :shell, path: "vagrantServerSetup.sh", env: {"GIT_URL" => ENV['GIT_URL']}, privileged: false
end

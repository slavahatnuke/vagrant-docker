VAGRANTFILE_API_VERSION = "2"

ip = "192.168.10.10"
name = "docker"
home = "/home/vagrant/project"
memory = "512"
cpu="2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider "virtualbox" do |v|
    v.name = name
    v.customize ["modifyvm", :id, "--memory", memory]
    v.customize ["modifyvm", :id, "--cpus", cpu]
    v.customize ["modifyvm", :id, "--vram", "16"]
  end

  config.vm.network :private_network, ip: ip
  config.vm.synced_folder ".", home

  Vagrant.configure("2") do |config|

    #install docker
    config.vm.provision "shell",
      inline: "curl -sSL https://get.docker.io/ubuntu/ | sudo sh"

  end

end

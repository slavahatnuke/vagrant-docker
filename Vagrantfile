VAGRANTFILE_API_VERSION = "2"

name = "docker"
memory = "512"
cpu="4"
type="nfs"
ip = "192.168.10.10"
home = "/home/vagrant/project"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.synced_folder ".", home, type: type
  config.vm.network :private_network, ip: ip

  config.vm.provider "virtualbox" do |v|
    v.name = name
    v.customize ["modifyvm", :id, "--memory", memory]
    v.customize ["modifyvm", :id, "--cpus", cpu]
    v.customize ["modifyvm", :id, "--vram", "8"]
  end

  #provision

  ##libs
  config.vm.provision "shell", inline: "which make || sudo apt-get install -y make"
  config.vm.provision "shell", inline: "which curl || sudo apt-get install -y curl"
  config.vm.provision "shell", inline: "sudo dpkg -l | grep bash-completion || ( sudo apt-get install -y bash-completion && sudo cp /home/vagrant/.bashrc /root/.bashrc )"

  ##docker
  config.vm.provision "shell", inline: "which docker || curl -sSL https://get.docker.io/ubuntu/ | sudo sh"

  ##vagrant
  config.vm.provision "shell", inline: "which vagrant || ( URL=https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.deb; FILE=tmpfile; wget --progress=dot $URL -O $FILE && sudo dpkg -i $FILE; rm $FILE )"


end

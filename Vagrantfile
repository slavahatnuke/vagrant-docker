VAGRANTFILE_API_VERSION = "2"

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

  #sync
  config.vm.synced_folder ".", home

  #provision
  config.vm.provision "shell", inline: "which curl || sudo apt-get install -y curl"
  config.vm.provision "shell", inline: "which docker || curl -sSL https://get.docker.io/ubuntu/ | sudo sh"
  config.vm.provision "shell", inline: "which vagrant || ( URL=https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.deb; FILE=mktemp; wget --progress=dot $URL -O $FILE && sudo dpkg -i $FILE; rm $FILE )"

end

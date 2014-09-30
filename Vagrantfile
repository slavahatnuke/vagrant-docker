VAGRANTFILE_API_VERSION = "2"

name = "docker"
memory = "256"
cpu="2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider "virtualbox" do |v|
    v.name = name
    v.customize ["modifyvm", :id, "--memory", memory]
    v.customize ["modifyvm", :id, "--cpus", cpu]
    v.customize ["modifyvm", :id, "--vram", "8"]
  end

  #provision

  ##docker
  config.vm.provision "shell", inline: "which curl || sudo apt-get install -y curl"
  config.vm.provision "shell", inline: "which docker || curl -sSL https://get.docker.io/ubuntu/ | sudo sh"

  ##vagrant
  config.vm.provision "shell", inline: "which vagrant || ( URL=https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.deb; FILE=tmpfile; wget --progress=dot $URL -O $FILE && sudo dpkg -i $FILE; rm $FILE )"

  ##plugins
  config.vm.provision "shell", inline: "which gem || sudo apt-get install -y rubygems build-essential"
  config.vm.provision "shell", inline: "which librarian-chef || sudo gem install librarian-chef"
  config.vm.provision "shell", inline: "sudo vagrant plugin list | grep vagrant-hostsupdater || ( sudo vagrant plugin install vagrant-hostsupdater )"

end

# Docker inside
 - requirements: `git`, `vagrant`, `virtualbox`

## Box stuff
```
#clone project
git clone git@github.com:slavahatnuke/vagrant-docker.git

#build vagrant box
vagrant up

#go to the box
vagrant ssh
```

## Docker stuff
```
#go to the workspace
cd ~/project

#build container based on Dockerfile
sudo docker build --tag project .

#check built images
sudo docker images

#run process inside container
sudo docker run --name project project echo "hello project"

#check run containers
sudo docker ps --all

#remove container
sudo docker rm project

#check run containers
sudo docker ps --all

#remove images
sudo docker rmi project

#check built images
sudo docker images
```

#Worflows
```
#mount project folder to container
sudo docker run --rm  --interactive --tty --volume $(pwd):/project --name project project /bin/bash

#check mounted folder
ls /project/

```


#Pilot stuff
```
#go to the pilot project
cd /vagrant/pilot

#build pilot vagrant box based on docker
vagrant up --provider docker

#go to the built box
vagrant ssh
```

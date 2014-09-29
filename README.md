# Docker inside

## Box stuff
```
git clone git@github.com:slavahatnuke/vagrant-docker.git
vagrant up
vagrant ssh
```

## Docker stuff
```
cd project
#build container based on Dockerfile
sudo docker build -t project .

#check built images
sudo docker images

#run process inside container
sudo docker run --name project project echo "hello project"

#check run containers
sudo docker ps -a

#remove container
sudo docker rm project

#check run containers
sudo docker ps -a

#remove images
sudo docker rmi project

#check built images
sudo docker images
```

#Worflows
```
#mount project to container
sudo docker run --rm -it -v $(pwd):/project --name project project /bin/bash

#check mounted folder
ls project/

```
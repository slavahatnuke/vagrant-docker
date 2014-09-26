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
sudo docker build -t project .
sudo docker images
sudo docker run --name project project echo "hello project"
sudo docker ps -a
sudo docker rm project
sudo docker rmi project
```

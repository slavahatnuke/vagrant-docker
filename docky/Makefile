
NAME=docky
BOX=ubuntu:precise

UP=echo hello

all: processes

projects:
	docker images

init:
	docker run --name $(NAME)-init $(BOX) echo $(NAME) && docker commit $(NAME)-init $(NAME) && docker rm $(NAME)-init

commit:
	docker commit $(NAME) $(NAME)

processes:
	docker ps -a

ps: processes

setup:
	docker run --rm -it --name $(NAME) $(NAME) /bin/bash

project: setup
run: setup

stop:
	( docker ps -a | grep $(NAME) && docker rm $(NAME) ) || echo "stopped"

start:
	docker run --name $(NAME) $(NAME) $(UP)

remove: stop
	docker rmi $(NAME)

export:
	docker export $(NAME) > $(NAME).tar

import:
	cat $(NAME).tar | sudo docker import - $(NAME)

up: start
down: stop
reload: stop start

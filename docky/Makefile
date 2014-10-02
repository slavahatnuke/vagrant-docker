
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
	( docker images | grep $(NAME) > /dev/null && echo "\n\n" && docker run --rm -it --name $(NAME) $(NAME) /bin/bash ) || echo "[NOTICE] make import or make init"

run: setup

stop:
	( docker ps -a | grep $(NAME) && docker rm $(NAME) ) || echo "stopped"

start:
	docker run --name $(NAME) $(NAME) $(UP)

remove: stop
	docker rmi $(NAME)

export:
	docker export $(NAME) | gzip --fast > $(NAME).tar.gz

import:
	cat $(NAME).tar.gz | sudo docker import - $(NAME)

up: start
down: stop
reload: stop start

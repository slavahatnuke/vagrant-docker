
NAME=docky
BOX=ubuntu:precise
UP=echo hello

DIR = $(shell pwd)
GIT_STATUS = $(shell git status --short)

#options
message=

all: processes

projects:
	docker images

init: git-init
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
	( docker ps -a | grep $(NAME) > /dev/null && docker rm $(NAME) ) || echo "stopped"

start:
	docker run --name $(NAME) $(NAME) $(UP)

remove: stop
	docker rmi $(NAME)

export:
	docker export $(NAME) | gzip --fast > $(NAME).tar.gz

import:
	cat $(NAME).tar.gz | sudo docker import - $(NAME)

save: commit export git-add git-commit

git-add:
	git add . && git add -u

git-commit:
	git commit -m "$(GIT_STATUS) $(message)"

git-init:
	ls -a | grep .git || git init

up: start
down: stop
reload: stop start

test:
	echo $(ARG1)
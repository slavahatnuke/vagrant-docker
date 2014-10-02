
NAME=docky
BOX=ubuntu:precise
UP=echo hello
LOG=/dev/null
DIR = $(shell pwd)
GIT_STATUS = $(shell git status --short)

#options
message=

all: projects

images: projects

projects:
	docker images

init: git-init dir-init
	docker run --name $(NAME)-init $(BOX) echo $(NAME)
	docker commit $(NAME)-init $(NAME)
	docker rm $(NAME)-init

commit:
	docker commit $(NAME) $(NAME)

processes:
	docker ps -a

ps: processes

setup:
	( docker images | grep $(NAME) > $(LOG) && echo "\n\n" && docker run --rm -it --name $(NAME) $(NAME) /bin/bash ) || echo "[NOTICE] make import or make init"

run: setup

stop:
	( docker ps -a | grep $(NAME) > $(LOG) && docker rm $(NAME) ) || echo "stopped"

start:
	docker run --name $(NAME) $(NAME) $(UP)

remove: stop
	docker rmi $(NAME)

export.tar.gz:
	docker export $(NAME) | gzip --fast > $(NAME).tar.gz

import.tar.gz:
	cat $(NAME).tar.gz | sudo docker import - $(NAME)

save: commit export git-add git-commit

export:
	docker export $(NAME) | tar -C $(NAME) -xf - 2> $(LOG) || echo OK

import:
	tar -C $(NAME) -c --to-stdout . | sudo docker import - $(NAME)

pull: git-pull
push: git-push

git-add:
	git add .
	git add -u

git-commit:
	git commit -m "- $(message)"

git-pull:
	git fetch
	git pull

git-push:
	git push --all

git-init:
	ls -a | grep .git || git init

dir-init:
	mkdir $(NAME) || echo OK

git-remove:
	rm -rf .git

up: start
down: stop
reload: stop start

test:
	echo $(ARG1)
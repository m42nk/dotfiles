DOCKER_TAG ?= ansbile-ubuntu:0.0.0
TARGET_USER ?= ${USER}
TARGET_DIR ?= /home/${TARGET_USER}/ansible

play p:
	ansible-playbook --ask-become-pass bootstrap.yml

play-debug pd:
	ansible-playbook --ask-become-pass -vvv --diff bootstrap.yml

prepare:
	@echo "Prepare for ansible"
	./prepare.sh

build-run br:
	make build
	make run
 
build b:
	docker build --tag ${DOCKER_TAG} .

run r:
	docker run --env TARGET_USER=${TARGET_USER} --env TARGET_DIR=${TARGET_DIR} --volume ${PWD}:${TARGET_DIR} --rm -it ${DOCKER_TAG}

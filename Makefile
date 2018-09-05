include ./hack/help.mk

DOCKER_IMAGE_ANSIBLE ?= $(shell docker build -q .)

.PHONY: cli
cli: ##@development cli with ansible
	docker run -it --rm \
	--net=host \
	-v ~/.ssh/known_hosts:/root/.ssh/known_hosts:ro \
	$(shell [ ! -z "$(SSH_AUTH_SOCK)" ] && echo -v $(SSH_AUTH_SOCK):$(SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$(SSH_AUTH_SOCK)) \
	-v $(shell pwd):/source \
	-w /source \
	$(DOCKER_IMAGE_ANSIBLE) bash
	# -v ~/.ssh:/root/.ssh:ro

.PHONY: setup
setup: ##setup runs ansible against inventory
	ansible-playbook ansible/digitalocean-playbook.yml

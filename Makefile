.Phony: help

SHELL := /bin/bash
PATH := $(PATH)

OS_VERSION_NAME := $(shell lsb_release -cs)
HOSTNAME = $(shell hostname)

LOCAL_BIN = $(shell echo $$HOME/.local/bin)

ifneq (,$(findstring $(LOCAL_BIN),$(PATH)))
  PATH := $(PATH)
else
  export PATH := $(LOCAL_BIN):$(PATH); @echo $(PATH)
endif

PRIVATE_INVENTORY = ".inventory"
ifeq ($(shell test -e $(PRIVATE_INVENTORY) && echo -n yes), yes)
  INVENTORY = $(PRIVATE_INVENTORY)
else
  INVENTORY = "inventory"
endif

USER_STRING = '{"users": [{"username": "$(shell whoami)", "skip_zshrc": true}], "ansible_user": "$(shell whoami)"}'

INSTALL_ANSIBLE_ROLES = ansible-galaxy install -r requirements.yml
ANSIBLE_PLAYBOOK = ansible-playbook desktop.yml -v -i $(INVENTORY) -l $(HOSTNAME) -e $(USER_STRING)

#ANSIBLE = $(INSTALL_ANSIBLE_ROLES) && $(ANSIBLE_PLAYBOOK) --ask-become-pass
ANSIBLE = $(ANSIBLE_PLAYBOOK) --ask-become-pass

-include make.env

$(warning ANSIBLE is $(ANSIBLE))

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ".:*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup_inventory_and_group_vars:
setup_inventory_and_group_vars:
	bash scripts/setup_inventory_and_group_vars.sh

bootstrap-before-install:
bootstrap-before-install:
	bash scripts/before_install_apt_dependencies.sh

bootstrap-install:
bootstrap-install:
	bash scripts/install_python3_dependencies.sh

bootstrap-before-script:
bootstrap-before-script:
	bash scripts/before_script_path_fix.sh

bootstrap: setup_inventory_and_group_vars bootstrap-before-install bootstrap-install bootstrap-before-script
bootstrap: ## Installs dependencies needed to run playbook

bootstrap-check:
bootstrap-check: ## Check that PATH and requirements are correct
	@ansible --version | grep "python version"
	@python3 -m pip list | grep psutil

check: DARGS?=
check: ## Checks desktop.yml playbook
	@$(ANSIBLE) --check

install: DARGS?=
install:
	@$(ANSIBLE)

all: ## Bootstrap, verify and install
all: bootstrap bootstrap-check lint install #non-ansible

#non-ansible:
#non-ansible:

lint:
lint:
	bash scripts/lint.sh

#docs-develop:
#docs-develop:
#  pipenv
#  pipenv run python3 -m pip install -r requirements.txt
#  pipenv shell

#docs-live:
#docs-live:
#  bash scripts docs-live.sh

#zsh:
#zsh:
#  @$(ANSIBLE) --tags="zsh"

#yadm:
#yadm:
#  @$(ANSIBLE) --tags="yadm"

#docker:
#docker:
#  @$(ANSIBLE) --tags="yadm"

.DEFAULT_GOAL := help

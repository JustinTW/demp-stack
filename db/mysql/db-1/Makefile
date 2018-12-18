cachef ?= ../../../.env/cache.env
include $(cachef)
export $(shell sed 's/=.*//' $(cachef))

cnf ?= ../../../.env/config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

dpl ?= ../../../.env/deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

COMPOSE_FILE ?= docker-compose.yml

VERSION=$(shell ./version.sh)
EXEC = @../../../.utils/bash/main exec
MAKE = make --no-print-directory

# HELP
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ''
	@../../../.utils/bash/main ps

.DEFAULT_GOAL := help

# Build and run the container
up: fix-permission ## Boot up container
	@../../../.utils/bash/main up
	@echo 'please excute ./scripts/grant-privileges.sh to setup privileges for first time boot up'

restart: up ## Restart container

stop: fix-permission ## Stop running containers
	@../../../.utils/bash/main stop

ps: fix-permission ## List running containers
	@../../../.utils/bash/main ps

at: ensure-env-alive ## Attach running containers
	@../../../.utils/bash/main at

logs: ## Fetch the logs of running containers
	@../../../.utils/bash/main logs

build: ensure-env-alive ## Build Project
	$(EXEC) make build

ensure-env-alive: fix-permission
	@../../../.utils/bash/main ensure-env-alive

clean: stop fix-permission## Clean the generated/compiles files
	@sudo rm -rf ./data/mysql
	@$(MAKE) up

version: ## output to version
	@echo $(VERSION)

fix-permission:
	@sudo mkdir -p ./data/mysql
	@sudo chmod 777 ./data/mysql -R

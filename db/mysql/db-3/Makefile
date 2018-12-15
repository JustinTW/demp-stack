# You can change the default config with `make cnf="config_special.env" build`
cachef ?= ../../../.env/cache.env
include $(cachef)
export $(shell sed 's/=.*//' $(cachef))

# You can change the default config with `make cnf="config_special.env" build`
cnf ?= ../../../.env/config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# You can change the default deploy config with `make dpl="deploy_special.env" release`
dpl ?= ../../../.env/deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

# You can change the default docker-compose with `make COMPOSE_FILE="docker-compose_special.yml"`
COMPOSE_FILE ?= docker-compose.yml

VERSION=$(shell ./version.sh)

EXEC = @../../../.utils/bash/main exec

# HELP
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ''
	@../../../.utils/bash/main ps

.DEFAULT_GOAL := help

# Build and run the container
up: ## Boot up container
	@../../../.utils/bash/main up

restart: up ## Restart container

stop: ## Stop running containers
	@../../../.utils/bash/main stop

ps: ## List running containers
	@../../../.utils/bash/main ps

at: ensure-env-alive ## Attach running containers
	@../../../.utils/bash/main at

logs: ## Fetch the logs of running containers
	@../../../.utils/bash/main logs

build: ensure-env-alive ## Build Project
	$(EXEC) make build

ensure-env-alive:
	@../../../.utils/bash/main ensure-env-alive

clean: ## Clean the generated/compiles files
	@echo Nothing to do.
version: ## output to version
	@echo $(VERSION)

cachef ?= ../.env/cache.env
include $(cachef)
export $(shell sed 's/=.*//' $(cachef))

cnf ?= ../.env/config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

dpl ?= ../.env/deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

COMPOSE_FILE ?= docker-compose.yml
export COMPOSE_FILE $(COMPOSE_FILE)

VERSION=$(shell ./version.sh)

MAKE = make --no-print-directory
EXEC = @../.utils/bash/main exec
ENSURE_DEPS = $(foreach c,$(shell ls ../apps),$(MAKE) -C ../apps/$(c) ensure-env-alive && ) true

# HELP
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo ''
	@../.utils/bash/main ps

.DEFAULT_GOAL := help

# Build and run the container
up: ## Boot up container
	# Ensure dependancy containers alive
	@$(ENSURE_DEPS)
	# Boot up nginx
	@../.utils/bash/main up

reload: ## Reload nginx to apply config
	$(EXEC) nginx -s reload

restart: up ## Restart container

stop: ## Stop running containers
	@../.utils/bash/main stop

ps: ## List running containers
	@../.utils/bash/main ps

at: ensure-env-alive ## Attach running containers
	@../.utils/bash/main at

logs: ## Fetch the logs of running containers
	@../.utils/bash/main logs

build: ensure-env-alive ## Build Project
	$(EXEC) $(MAKE) build

ensure-env-alive:
	@$(ENSURE_DEPS)
	@../.utils/bash/main ensure-env-alive

clean: ## Clean the generated/compiles files
	@echo Nothing to do.

version: ## output to version
	@echo $(VERSION)

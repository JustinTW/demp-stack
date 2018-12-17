cachef ?= .env/cache.env
include $(cachef)
export $(shell sed 's/=.*//' $(cachef))

cnf ?= .env/config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

dpl ?= .env/deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

COMPOSE_FILE ?= docker-compose.yml

VERSION=$(shell ./version.sh)

MAKE = make --no-print-directory
EXEC = @./.utils/bash/main exec
ENTRYPOINT = nginx

# HELP
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# Build and run the container
up: ## Boot up
	@$(MAKE) up -C $(ENTRYPOINT)

reload:
	@$(MAKE) reload -C $(ENTRYPOINT)

restart: up ## Restart container

stop: ## Stop running containers
	# Stop apps
	@$(foreach c,$(shell ls ./apps),$(MAKE) -C ./apps/$(c) stop && ) true
	# Stop mysql
	@$(foreach c,$(shell ls ./db/mysql),$(MAKE) -C ./db/mysql/$(c) stop && ) true
	# Stop postgresql
	@$(foreach c,$(shell ls ./db/postgresql),$(MAKE) -C ./db/postgresql/$(c) stop && ) true
	# Stop nginx
	@$(MAKE) stop -C $(ENTRYPOINT)

ps: ## List running containers
	@docker ps

at: ensure-env-alive ## Attach running containers
	@$(MAKE) at -C $(ENTRYPOINT)

logs: ## Fetch the logs of running containers
	@$(MAKE) logs -C $(ENTRYPOINT)

ensure-env-alive:
	@$(MAKE) ensure-env-alive -C $(ENTRYPOINT)

clean: ## Clean the generated/compiles files
	@echo Nothing to do.

version: ## output to version
	@echo $(VERSION)

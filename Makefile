SHELL := /bin/bash
VERSION := `date +%Y%m%d%H%M`
GREEN := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
RESET := $(shell tput -Txterm sgr0)

.PHONY: help tests deps build api web clean

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "${YELLOW}%-16s${GREEN}%s${RESET}\n", $$1, $$2}' $(MAKEFILE_LIST)

save: ## Save changes into repository automatically.
	@git add .
	@git commit -m "Save changes at: $$(date +%s)"
	@git push

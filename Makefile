tag=mrwalter/garageqtpi:latest

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

build: ## Build the container
	    @docker build -t $(tag) ./

run: ## Run container
	docker run -i -t --rm $(tag)

up: build run ## Run container (Alias to run)

stop: ## Stop and remove a running container
	docker stop $(tag); docker rm $(tag)

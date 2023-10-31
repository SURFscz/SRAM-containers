SHELL := /bin/bash
IMAGE = sram-ldap

.PHONY: help

help:
	@grep -E '^[\%a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

build: ## Build image
	docker build \
	--no-cache -t \
	$(IMAGE) \
	.

start: ## Start container
	docker run -ti --rm \
	-v $(PWD)/web:/opt/web \
	-p 389:389 \
	-p 636:636 \
	$(IMAGE)

clean: ## Remmove image
	docker rmi \
	$(IMAGE)

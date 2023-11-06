SHELL := /bin/bash
IMAGE = sram-pyff

.PHONY: help

help:
	@grep -E '^[\%a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

build: ## Build image
	docker build -t \
	$(IMAGE) \
	.

start: ## Start container
	docker run -ti --rm \
	-v $(PWD)/certs:/opt/pyff/certs \
	-v $(PWD)/feeds:/opt/pyff/feeds \
	-v $(PWD)/web:/opt/pyff/web \
	-v $(PWD)/xslt:/opt/pyff/xslt \
	-v $(PWD)/src:/opt/pyff/src \
	$(IMAGE)

clean: ## Remmove image
	docker rmi \
	$(IMAGE)

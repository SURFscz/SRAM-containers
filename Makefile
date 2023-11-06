SHELL := /bin/bash

.PHONY: help

help:
	@grep -E '^[\%a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

build: ./*/	## Build images
	@for d in $^; do \
		echo "path: [$${d}]" && \
		$(MAKE) build -C $${d}; \
	done

clean: ./*/	## Remove images
	@for d in $^; do \
		echo "path: [$${d}]" && \
		$(MAKE) clean -C $${d}; \
	done

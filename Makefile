# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
# THIS_FILE := $(lastword $(MAKEFILE_LIST))
THIS_FILE := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

include vars.mk

.PHONY: build-push
build-push: ## build and push multiplatform Docker image to Docker Hub
	# linux/amd64 (e.g., intel), linux/arm64 (e.g., Apple Silicon), linux/arm/v7 (e.g., Raspberry Pi)
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t $(DOCKER_IMAGE) -t $(DOCKER_REPO):latest --push .

.PHONY: build-amd64
build-amd64: ## build linux/amd64 Docker image locally
	docker buildx build --platform linux/amd64 -t $(DOCKER_IMAGE) -t $(DOCKER_REPO):latest --load .

.PHONY: build-arm64
build-arm64: ## build linux/arm64 Docker image locally
	docker buildx build --platform linux/arm64 -t $(DOCKER_IMAGE) -t $(DOCKER_REPO):latest --load .

.PHONY: build-armv7
build-armv7: ## build linux/arm/v7 Docker image locally
	docker buildx build --platform linux/arm/v7 -t $(DOCKER_IMAGE) -t $(DOCKER_REPO):latest --load .

.PHONY: build
build: build-amd64 build-arm64 build-armv7 ## build all locally

.PHONY: help
help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

.DEFAULT_GOAL := help

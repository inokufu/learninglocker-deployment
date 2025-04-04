ifeq (, $(shell which docker 2>/dev/null))
  $(error "No docker found in PATH!")
endif

include .env

DOCKER_COMPOSE_AVAILABLE := $(shell docker compose version >/dev/null 2>&1 && echo yes || echo no)

ifeq ($(DOCKER_COMPOSE_AVAILABLE),yes)
  COMPOSE_CMD = docker compose
else
  COMPOSE_CMD = docker-compose
endif

PROJECT_NAME = learninglocker

ENV ?= dev

COMPOSE_FILES = -f docker-compose.yml -f docker-compose.$(ENV).yml
LL_API_EXEC = $(GLOBAL_COMPOSE_CMD) exec api node cli/dist/server

.PHONY: build up down logs ll-create-admin ll-disable-register ll-init

GLOBAL_COMPOSE_CMD = $(COMPOSE_CMD) $(COMPOSE_FILES)

build:
	$(GLOBAL_COMPOSE_CMD) build

up:
	$(GLOBAL_COMPOSE_CMD) up -d

down:
	$(GLOBAL_COMPOSE_CMD) down

logs:
	$(GLOBAL_COMPOSE_CMD) logs -f

ll-create-admin:
	$(LL_API_EXEC) createSiteAdmin "${MASTER_EMAIL}" "${ORGANIZATION_NAME}" "${MASTER_PASSWORD}"

ll-disable-register:
	$(LL_API_EXEC) disableRegister

ll-init: ll-create-admin ll-disable-register

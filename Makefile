SHELL := /usr/bin/env bash

prod:
	docker-compose -f docker-compose.yml -f docker-compose-prod.yml up -d

dev:
	docker-compose -f docker-compose.yml -f docker-compose-dev.yml up
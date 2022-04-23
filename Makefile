DOCKER_COMPOSE=docker-compose -f vendor/localterra/docker-compose.yml

start: compile docker-up

stop: docker-down

restart: stop start

test: compile docker-up
	make -C ./integration test
	make docker-down

compile:
	sh scripts/build_release.sh

deploy-to-terra: compile
	cd integration && \
	CHAIN_URL=$(CHAIN_URL) \
	CHAIN_ID=$(CHAIN_ID) \
	CHAIN_NAME=$(CHAIN_NAME) \
	make deploy-to-terra

docker-up:
	$(DOCKER_COMPOSE) up -d --remove-orphans

docker-up-inline:
	$(DOCKER_COMPOSE) up --remove-orphans

docker-down:
	$(DOCKER_COMPOSE) down --remove-orphans
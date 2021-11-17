start: build docker-up
	cd integration && make test

stop: docker-down

restart: stop start

test: build docker-up
	cd integration && make test && \
	cd .. && make docker-down

build:
	cargo test
	sh scripts/build_release.sh

docker-up:
	cd local && \
	docker-compose up -d --remove-orphans

docker-up-inline:
	cd local && \
	docker-compose up --remove-orphans

docker-down:
	cd local && \
	docker-compose down --remove-orphans

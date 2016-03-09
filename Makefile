COMPOSE_UP = docker-compose up -d

run: build
	$(COMPOSE_UP) postgres
	sleep 5
	$(COMPOSE_UP) taiga-init
	sleep 5
	$(COMPOSE_UP) taiga-back
	sleep 5
	$(COMPOSE_UP) taiga-front

demo: run
	$(COMPOSE_UP) taiga-demo

recreate:
	docker-compose kill
	docker-compose rm -f
	make run

build: submodules
	docker-compose build

submodules:
	git submodule init
	git submodule update

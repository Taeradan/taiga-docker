COMPOSE_UP = docker-compose up -d

run:
	$(COMPOSE_UP) taiga-front

run-local: build
	make run

demo: run
	$(COMPOSE_UP) taiga-demo

recreate:
	docker-compose kill
	docker-compose rm -f
	make run

build: submodules
	docker build -t taeradan/taiga-backend backend
	docker build -t taeradan/taiga-frontend frontend

submodules:
	git submodule init
	git submodule update

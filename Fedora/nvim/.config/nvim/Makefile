build-run: build run

build:
	docker build -t dockerized-nvim:latest .

run:
	docker run --rm -it dockerized-nvim:latest $(arg)

run-bash:
	docker run --rm -it dockerized-nvim:latest bash


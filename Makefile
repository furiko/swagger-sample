SERVER_REPOSITORY_NAME:=furiko/swagger-sample
SERVER_CONTAINER_NAME:=swagger-sample-server

HOST_APP_BASE:=$(shell pwd)
DOCKER_APP_BASE:=/go/src/github.com/furiko/swagger-sample

local/run:
	$(MAKE) run
	@echo 'connect server port :3000 !!!'

docker/run:
	$(MAKE) docker/run/server

docker/run/server:
	docker run -d --name $(SERVER_CONTAINER_NAME) -p 1323:1323 -v $(HOST_APP_BASE):$(DOCKER_APP_BASE) $(SERVER_REPOSITORY_NAME):latest
	@echo 'connect server port :3000 !!!'

docker/stop:
	$(MAKE) docker/stop/server
	docker container rm $(SERVER_CONTAINER_NAME)


docker/stop/server:
	docker container stop $(SERVER_CONTAINER_NAME)

run:
	fresh
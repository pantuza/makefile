#
# Simple Makefile for automating daily tasks on a project
#


# ******** VARIABLE BLOCK ********
IMG_TAG := makefile:latest

APP_NAME := makefile



# ******** RULES BLOCK ********

# First target is always the default rule.
# In this case it will be the help message
help:
	@echo
	@echo ".   ,     ,             .      "
	@echo "|\ /|     |        ,- o |      "
	@echo "| V | ,-: | , ,-.  |  . | ,-.  "
	@echo "|   | | | |<  |-'  |- | | |-'  "
	@echo "'   ' '-' ' \` '-'  |  ' ' '-' "
	@echo "                  -'           "
	@echo "Available target rules"
	@echo
	@echo "build              Build docker image locally"
	@echo "start              Runs the application container"
	@echo "stop               Stops the application container"
	@echo "restart            Restarts the application container"
	@echo "logs               Follow application logs"
	@echo "test               Runs tests inside the application container"


# Builds the docker image based on the Dockerfile
build: Dockerfile
	$(info Building docker image)
	@docker build --tag makefile:latest .


# Runs the application on a container
start:
	$(info Running application container)
	@docker run -it --rm -p 8080:8080 --name $(APP_NAME) -d $(IMG_TAG)


# Stops a running application container
stop:
	$(info Stopping application container)
	@docker rm --force $(APP_NAME)


# Restarts the application container
restart: stop start


# Follows the logs of a running application container
logs:
	@docker logs --tail 50 --follow $(APP_NAME)


# Runs application tests
test:
	$(info Running application tests)
	@docker run -it --rm --name $(APP_NAME)-test $(IMG_TAG) go test

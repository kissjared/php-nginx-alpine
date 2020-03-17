all: build 
# push
.PHONY: build push test

TAG = 7.4-local

DOCKER_REGISTRY = docker.io/kissjared

APP = php-nginx-alpine

build:
	docker build -t $(DOCKER_REGISTRY)/$(APP):$(TAG) .

push:
	docker push $(DOCKER_REGISTRY)/$(APP):$(TAG)

clean:
	docker rm -f test

test:
	docker run --name test -d $(DOCKER_REGISTRY)/$(APP):$(TAG)
	docker ps -a|grep test
	docker logs test

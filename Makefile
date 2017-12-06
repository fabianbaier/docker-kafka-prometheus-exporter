DOCKER_IMAGE = fabianbaier/docker_kafka_prometheus_exporter
DOCKER_TAG := $(shell git rev-parse HEAD)

.PHONY: docker

.DEFAULT_GOAL := docker

docker: docker
	docker build -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
	docker tag $(DOCKER_IMAGE):$(DOCKER_TAG) $(DOCKER_IMAGE):latest
	docker tag $(DOCKER_IMAGE):$(DOCKER_TAG) $(DOCKER_IMAGE):$(version)
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
	docker push $(DOCKER_IMAGE):$(version)
	docker push $(DOCKER_IMAGE):latest
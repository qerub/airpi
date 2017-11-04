.DEFAULT_GOAL := amd64-debian-image

.PHONY: amd64-debian-image

TAG?=current

amd64-debian-image:
	docker build -f Dockerfile.amd64-debian -t airpi:$(TAG) .

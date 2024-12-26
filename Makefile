
include Makefile.inc

all: login bacnet provision worker web

login:
	az acr login -n nfdev

bacnet:
	docker buildx build -t $(REPO)boptest/bacnet:$(VERSION) . --push

provision:
	docker buildx build -t $(REPO)boptest/provision:$(VERSION) -f Dockerfile.provision . --push

worker:
	docker buildx build -t $(REPO)boptest/worker:$(VERSION) -f Dockerfile.worker . --push

web:
	docker buildx build -t $(REPO)boptest/web:$(VERSION) -f project1-boptest/service/web/Dockerfile ./project1-boptest --push

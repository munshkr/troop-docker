TAG_NAME := munshkr/troop

.PHONY: build push run

build:
	@docker build -t $(TAG_NAME) .
	@docker tag $(TAG_NAME) $(TAG_NAME)

push: build
	@docker push $(TAG_NAME)

run:
	@docker run -ti --rm --network host $(TAG_NAME)

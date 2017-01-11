all: build

build:
	@docker build --tag=ajaysingh452/openfire .

release: build
	@docker build --tag=ajaysingh452/openfire:$(shell cat VERSION) .

.PHONY: test build push run install shell example example-core example-dev example-destroy example-destroy-dev example-destroy-core

SECRETS = -e AWS_DEFAULT_REGION -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID
MY_PWD := $(shell pwd)
PWD_ARG = -v $(MY_PWD):/app -w /app

EX_SIMPLE_PWD = examples/simple

all: fmt plan

install: keygen init get

keygen:
	if [ ! -d ".ssh" ]; then mkdir .ssh; fi
	if [ ! -f ".ssh/terraform" ]; then ssh-keygen -f .ssh/terraform; fi

fmt:
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:light fmt

get:
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:light get --update

init:
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:light init

plan:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:light plan
	export TF_LOG=

apply:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:light apply

destroy:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:light destroy

example-full: example-packer example

example: example-core example-dev

example-packer:
	cd example/packer && \
	make

example-core:
	cd example/environments/core && \
	make apply tf_args="-auto-approve"

example-dev:
	cd example/environments/dev && \
	make apply tf_args="-auto-approve"

example-prod:
	cd example/environments/prod && \
	make apply tf_args="-auto-approve"

example-destroy: example-destroy-dev example-destroy-core

example-destroy-dev:
	cd example/environments/dev && \
	make destroy tf_args="-auto-approve"

example-destroy-core:
	cd example/environments/core && \
	make destroy tf_args="-auto-approve"

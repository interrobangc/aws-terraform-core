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
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 fmt

get:
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 get --update

init:
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 init

plan:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 plan
	export TF_LOG=

apply:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 apply

destroy:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 destroy

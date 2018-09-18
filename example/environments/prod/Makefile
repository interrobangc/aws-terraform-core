.PHONY: keygen get init plan apply destroy

SECRETS = -e AWS_DEFAULT_REGION -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID
MY_PWD := $(shell cd ../../../; pwd)
PWD_ARG = -v $(MY_PWD):/app -w /app/example/environments/prod

all: keygen init get plan

keygen:
	if [ ! -d ".ssh" ]; then mkdir .ssh; fi
	if [ ! -f ".ssh/terraform" ]; then ssh-keygen -f .ssh/terraform; fi

get:
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 get --update $(tf_args)

init:
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 init $(tf_args)

plan:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 plan $(tf_args)
	export TF_LOG=

apply:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 apply $(tf_args)

destroy:
ifdef DEBUG
	export TF_LOG="DEBUG"
endif
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/terraform:0.11.8 destroy $(tf_args)

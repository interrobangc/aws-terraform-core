.PHONY: test build push run install shell example core dev destroy destroy-dev destroy-core

SECRETS = -e AWS_DEFAULT_REGION -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID
MY_PWD := $(shell pwd)
PWD_ARG = -v $(MY_PWD):/app -w /app

all: fmt plan

install: keygen init

init: init-core init-dev init-prod

init-core:
	cd environments/core && \
	make init

init-dev:
	cd environments/dev && \
	make init

init-prod:
	cd environments/prod && \
	make init

full: packer init apply

apply: apply-core apply-dev apply-prod

packer:
	cd packer && \
	make

apply-core:
	cd environments/core && \
	make apply tf_args="-auto-approve"

apply-dev:
	cd environments/dev && \
	make apply tf_args="-auto-approve"

apply-prod:
	cd environments/prod && \
	make apply tf_args="-auto-approve"

destroy: destroy-prod destroy-dev destroy-core

destroy-prod:
	cd environments/prod && \
	make destroy tf_args="-auto-approve"

destroy-dev:
	cd environments/dev && \
	make destroy tf_args="-auto-approve"

destroy-core:
	cd environments/core && \
	make destroy tf_args="-auto-approve"

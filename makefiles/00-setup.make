.PHONY: test build push run install shell example example-core example-dev example-destroy example-destroy-dev example-destroy-core

SECRETS = -e AWS_DEFAULT_REGION -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID
MY_PWD := $(shell pwd)
PWD_ARG = -v $(MY_PWD):/app -w /app

DEFAULT_ARGS = $(SECRETS) $(PWD_ARG)
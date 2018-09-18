.PHONY: keygen get init plan apply destroy

SECRETS = -e AWS_DEFAULT_REGION -e AWS_SECRET_ACCESS_KEY -e AWS_ACCESS_KEY_ID
MY_PWD := $(shell pwd)
PWD_ARG = -v $(MY_PWD):/app -w /app

all: build

build:
	docker run -it --rm $(SECRETS) $(PWD_ARG) hashicorp/packer build nginx.json
get:
	docker run -it --rm $(DEFAULT_ARGS) interrobangc/terraform:$(TF_VER) terraform get --update $(tf_args)

init:
	docker run -it --rm $(DEFAULT_ARGS) interrobangc/terraform:$(TF_VER) terraform init $(tf_args)

plan:
	docker run -it --rm $(DEFAULT_ARGS) interrobangc/terraform:$(TF_VER) terraform plan $(tf_args)

plan-landscape:
	docker run -it --rm $(DEFAULT_ARGS) interrobangc/terraform:$(TF_VER) bash -c "terraform plan $(tf_args) | landscape"

apply:
	docker run -it --rm $(DEFAULT_ARGS) interrobangc/terraform:$(TF_VER) terraform apply $(tf_args)

destroy:
	docker run -it --rm $(DEFAULT_ARGS) interrobangc/terraform:$(TF_VER) terraform destroy $(tf_args)

get-prod-env:
	docker run -it --rm $(DEFAULT_ARGS) interrobangc/terraform:$(TF_VER) bash -c "cd ../prod-core && terraform output production_env $(tf_args)"
## Quickstart

Setup an s3 bucket for shared state. Search and replace `tf-state-interrobangc` with the new bucket name in `./example`

Set your IAM keys as env variables:
```bash
export AWS_ACCESS_KEY_ID="AKIA000000000000000"
export AWS_SECRET_ACCESS_KEY="v00000000000000000000000000000000"
export AWS_DEFAULT_REGION="us-west-2"
```

Bring up example stack by running the following in the `./example` directory:

Run full example:
```
make full
```

Destroy full example:
```
make destroy
```

Create AMIs
```
make packer
```

Configure core (must finish before dev or prod can be configured):
```
make apply
```

Configure core:
```
make apply-core
```

Configure dev:
```
make apply-dev
```

Configure prod:
```
make apply-prod
```

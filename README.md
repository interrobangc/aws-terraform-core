##Quickstart

Setup an s3 bucket for shared state. Search and replace `tf-state-interrobangc` with the new bucket name in `./example`

Set your IAM keys as env variables:
```bash
export AWS_ACCESS_KEY_ID="AKIA000000000000000"
export AWS_SECRET_ACCESS_KEY="v00000000000000000000000000000000"
export AWS_DEFAULT_REGION="us-west-2"
```

Bring up entire example stack:

Run full example:
```
make example-full
```

Destroy full example:
```
make example-destroy
```

Create AMIs
```
make example-packer
```

Configure core (must finish before dev or prod can be configured):
```
make example-core
```

Configure dev:
```
make example-dev
```

Configure prod:
```
make example-prod
```

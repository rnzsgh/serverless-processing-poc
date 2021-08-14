REGION ?= us-east-1
PROFILE ?= test
ENV_NAME ?= dev

.PHONY: create-stack
create-stack:
	@aws cloudformation create-stack \
  --profile $(PROFILE) \
  --stack-name serverless-processing-poc-$(ENV_NAME) \
  --region $(REGION) \
  --capabilities CAPABILITY_NAMED_IAM \
  --template-body file://poc.cfn.yml \
	--parameters file://poc.json

.PHONY: delete-stack
delete-stack:
	@aws cloudformation delete-stack \
  --profile $(PROFILE) \
  --stack-name serverless-processing-poc-$(ENV_NAME) \
  --region $(REGION)

.PHONY: update-stack
update-stack:
	@aws cloudformation update-stack \
  --profile $(PROFILE) \
  --stack-name serverless-processing-poc-$(ENV_NAME) \
  --region $(REGION) \
  --capabilities CAPABILITY_NAMED_IAM \
  --template-body file://poc.cfn.yml \
	--parameters file://poc.json

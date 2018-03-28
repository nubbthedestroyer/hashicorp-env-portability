export AWS_DEFAULT_REGION=$(aws configure get region)
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)

vagrant up --provision

vagrant ssh

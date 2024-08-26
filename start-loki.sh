#!/bin/bash

# Fetch AWS credentials from Vault
export AWS_ACCESS_KEY_ID=$(vault kv get -field=aws_access_key_id secret/loki)
export AWS_SECRET_ACCESS_KEY=$(vault kv get -field=aws_secret_access_key secret/loki)

# Start Loki with the provided configuration file
exec /usr/bin/loki -config.file=/etc/loki/local-config.yaml

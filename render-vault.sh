#!/bin/bash
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

gomplate \
  -d vault=vault:///secret/app \
  -d config=./datasources/config.json \
  -f ./template/docker-compose.template.yml \
  -o docker-compose-vault.out.yml

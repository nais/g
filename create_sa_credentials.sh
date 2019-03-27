#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <enc_key> <nais_project_id>"
  exit 1
fi

KEY=$1
PROJECT_ID=$2

gcloud iam service-accounts keys create tmp.json --iam-account=nais-ci@${PROJECT_ID}.iam.gserviceaccount.com
openssl enc -e -aes-256-cfb -a -A -k ${KEY} < tmp.json > ${PROJECT_ID}-sa-credentials.json.enc
rm tmp.json

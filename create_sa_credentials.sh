#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <enc_key> <nais_project_id>"
  exit 1
fi

KEY=$1
PROJECT_ID=$2
CLUSTER_NAME=$(echo ${PROJECT_ID} | awk -F- '{print $2"-gcp"}')
gcloud iam service-accounts keys create tmp.json --iam-account=nais-ci@${PROJECT_ID}.iam.gserviceaccount.com
openssl enc -e -aes-256-cfb -a -A -k ${KEY} < tmp.json > ${CLUSTER_NAME}-sa-credentials.json.enc
rm tmp.json
echo "Created encrypted file ${CLUSTER_NAME}-sa-credentials.json.enc and removed tmp.json."
echo "Please make sure to commit encrypted key-file to github"

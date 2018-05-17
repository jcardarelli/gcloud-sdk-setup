#!/bin/bash

# Install docker
sudo apt-get install docker.io

# Pull the Google Cloud SDK docker image from docker hub 
# https://hub.docker.com/r/google/cloud-sdk
docker pull google/cloud-sdk

# Set these aliases in your ~/.profile for easy access to the Google Cloud SDK commands
alias gcloud="docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk gcloud"
alias bq="docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk bq"
alias gsutil="docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk gsutil"
alias kubectl="docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk kubectl"

source ~/.profile

# Run the cloud-sdk container with the "gcloud auth login" command to save your credentials in a docker volume
gcloud auth login

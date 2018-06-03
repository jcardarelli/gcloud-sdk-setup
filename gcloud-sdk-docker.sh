#!/bin/bash
DOCKER_VOLUME="gcloud-config"
DOCKER_IMAGE="google/cloud-sdk"
FILE=$HOME/.profile

# Install docker
sudo apt-get install docker-ce

# Pull the Google Cloud SDK docker image from docker hub 
# https://hub.docker.com/r/google/cloud-sdk
docker pull "$DOCKER_IMAGE"

# Set these aliases in your ~/.profile for easy access to the Google Cloud SDK commands
echo "alias gcloud="docker run --rm -ti --volumes-from $DOCKER_VOLUME $DOCKER_IMAGE gcloud"" >> "$FILE"
echo "alias bq="docker run --rm -ti --volumes-from $DOCKER_VOLUME $DOCKER_IMAGE bq"" >> "$FILE"
echo "alias gsutil="docker run --rm -ti --volumes-from $DOCKER_VOLUME $DOCKER_IMAGE gsutil"" >> "$FILE"
echo "alias kubectl="docker run --rm -ti --volumes-from $DOCKER_VOLUME $DOCKER_IMAGE kubectl"" >> "$FILE"

source "$FILE"

# Run the cloud-sdk container with the "gcloud auth login" command to save your credentials in a docker volume
gcloud auth login

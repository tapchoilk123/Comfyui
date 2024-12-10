#!/bin/bash

# Load environment variables from .env file
export $(cat .env | xargs)

# Build Docker image with environment variables
docker build \
  --build-arg GITHUB_TOKEN=$GITHUB_TOKEN \
  --build-arg GITHUB_USERNAME=$GITHUB_USERNAME \
  -t ghcr.io/$GITHUB_USERNAME/comfyui-fluxvideo:latest \
  .

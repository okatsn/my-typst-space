#!/bin/bash

set -e

IMAGE_NAME="okatsn/my-typst-space"

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 docker_build_and_push.sh <tag1> [tag2 ...]"
  sleep 5
  exit 1
fi

TAGS=("$@")

echo "Building Docker image with tag: $IMAGE_NAME:${TAGS[0]}"
docker build -t "$IMAGE_NAME:latest" .

for TAG in "${TAGS[@]}"; do
  echo "Tagging image as: $IMAGE_NAME:$TAG"
  docker tag "$IMAGE_NAME:latest" "$IMAGE_NAME:$TAG"

  echo "Pushing Docker image: $IMAGE_NAME:$TAG"
  docker push "$IMAGE_NAME:$TAG"
done

echo "Docker image built and pushed successfully for tags: ${TAGS[*]}"
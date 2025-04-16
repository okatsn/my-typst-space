#!/bin/bash

set -e

IMAGE_NAME="okatsn/my-typst-space"
BUILD_IMAGE=true
TAGS=()

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --no-build) BUILD_IMAGE=false; shift ;;
        *) TAGS+=("$1"); shift ;;
    esac
done

# Check if any tags were provided
if [ ${#TAGS[@]} -eq 0 ]; then
  echo "Usage: $0 [--no-build] <tag1> [tag2 ...]"
  sleep 5
  exit 1
fi

# Build the image if BUILD_IMAGE is true
if [ "$BUILD_IMAGE" = true ]; then
  echo "Building Docker image with tag: $IMAGE_NAME:${TAGS[0]}"
  # Build with the first tag provided
  docker build -t "$IMAGE_NAME:${TAGS[0]}" .
else
  echo "Skipping build step (--no-build specified)."
  echo "Assuming image $IMAGE_NAME:${TAGS[0]} already exists locally."
fi


# Tag and push all specified tags
for TAG in "${TAGS[@]}"; do
  # Tag additional tags if necessary (skip if it's the first tag and we built it)
  if [ "$TAG" != "${TAGS[0]}" ]; then
    echo "Tagging image as: $IMAGE_NAME:$TAG"
    # Tag from the first tag specified
    docker tag "$IMAGE_NAME:${TAGS[0]}" "$IMAGE_NAME:$TAG"
  fi

  echo "Pushing Docker image: $IMAGE_NAME:$TAG"
  docker push "$IMAGE_NAME:$TAG"
done

echo "Docker image processed successfully for tags: ${TAGS[*]}"

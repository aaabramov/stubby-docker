#!/bin/bash

IMAGE_TAG="abrasha/stubby-docker:$(cat version)"

echo "Start building $IMAGE_TAG"

docker build -t "$IMAGE_TAG" .

echo "Built $IMAGE_TAG"
#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=ar251/sklearn

# Step 2
# Run the Docker Hub container with kubernetes
minikube kubectl -- create deployment sklearn --image=ar251/sklearn:latest

# Step 3:
# List kubernetes pods
minikube kubectl -- get pods -A

# Step 4:
# Forward the container port to a host
minikube kubectl -- expose deployment sklearn --type=NodePort --port=80
minikube kubectl -- port-forward service/sklearn 8000:80

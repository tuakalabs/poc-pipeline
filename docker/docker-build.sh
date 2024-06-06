#!/bin/bash

base_dir="../backend/Services"

# Check if the service name and build version arguments are provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <service_name> <build_version>"
    exit 1
fi

service_name="$1"
build_version="$2"
service_dir="$base_dir/$service_name"

# Check if the service directory exists
if [ ! -d "$service_dir" ]; then
    echo "Service directory '$service_dir' does not exist."
    exit 1
fi

# Build the Docker image for the specified service and build version
docker build -t "tuakalabs01/pocapp:$service_name-$build_version" \
    --build-arg SERVICE_NAME="$service_name" \
    --build-arg SERVICE_DIR="$service_dir" \
    -f Dockerfile.service \
    .
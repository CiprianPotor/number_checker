#!/bin/bash

# Check for updates (assuming you have the appropriate git commands in place)
cd /root/SCRIPTS/app/application/
git fetch origin
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main) # Update to 'origin/main' instead of 'origin/master'
if [ "$LOCAL" != "$REMOTE" ]; then
    # Stop and remove the existing Docker container
    docker stop myapp
    docker rm myapp

    # Build a new Docker image
    docker build -t myapp /root/SCRIPTS/app/application/

    # Run a new Docker container
    docker run -d -p 8000:8000 --name myapp myapp
fi

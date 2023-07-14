#!/bin/bash

# Clone the repository (assuming you have the appropriate git commands in place)
cd /root/SCRIPTS/app/
git clone https://github.com/CiprianPotor/number_checker.git

# Change directory to the cloned repository
cd number_checker

# Build the Docker image
docker build -t myapp .

# Stop and remove the existing Docker container (if it exists)
docker stop myapp
docker rm myapp

# Run a new Docker container
docker run -d -p 8000:8000 --name myapp myapp

# Check for updates (assuming you have the appropriate git commands in place)
cd /root/SCRIPTS/app/application/
git fetch origin   # Fetch the latest changes from the remote repository

LOCAL=$(git rev-parse HEAD)             # Get the current local commit hash
REMOTE=$(git rev-parse origin/master)   # Get the latest remote commit hash

# Compare the local and remote commit hashes
if [ $LOCAL != $REMOTE ]; then
    # Stop and remove the existing Docker container
    docker stop myapp
    docker rm myapp

    # Build a new Docker image
    docker build -t myapp /root/SCRIPTS/app/application/

    # Run a new Docker container
    docker run -d -p 8000:8000 --name myapp myapp
fi

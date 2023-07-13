# Use the official Python base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application code to the container
COPY . .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the desired port (e.g., 8000)
EXPOSE 8000

# Set the entry point command to run the Flask application
CMD ["python", "app.py"]


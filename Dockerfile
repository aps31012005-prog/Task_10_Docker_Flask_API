# Use a lightweight Python base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy requirements first for better Docker layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Flask application
COPY flask_api.py .

# Copy trained deep learning model
COPY model ./model

# Expose Flask API port
EXPOSE 5000

# Start Flask API
CMD ["python", "flask_api.py"]
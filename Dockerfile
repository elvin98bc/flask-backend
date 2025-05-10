# Use an official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependencies file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY app.py .

# Use Gunicorn to run the app in production
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
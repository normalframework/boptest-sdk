# Use an official Python runtime as a base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

COPY app.py /app
COPY requirements.txt /app
COPY project1-boptest/testcases /app/testcases

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run app.py when the container launches
CMD ["python", "-u", "app.py"]
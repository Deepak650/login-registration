# Use the official Python image as a base image
FROM python:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the dependencies specified in the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Set environment variables for Django
# Disables buffering for easier container logging
ENV PYTHONUNBUFFERED 1

# Run database migrations (optional step)
# CMD ["python", "manage.py", "migrate"]

# Expose the port that the Django app runs on
EXPOSE 8000

# Specify the default command to run when starting the container
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install timezone data
RUN apt-get update && apt-get install -y tzdata

# Install git and ffmpeg
RUN apt-get install -y git ffmpeg

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run install.sh via sh to create virtual environment
RUN sh Install.sh

# Make port 7860 available to the world outside this container
EXPOSE 7860

# Run start-webui.sh script via sh when the container launches
CMD ["sh", "start-webui.sh"]
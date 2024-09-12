# Use the official Ubuntu 22.04 image as the base
FROM ubuntu:22.04

# Install necessary packages and Python 3.10
RUN apt-get update && \
    apt-get install -y python3.10-venv python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Robot Framework and SeleniumLibrary
RUN python3.10 -m pip install --upgrade pip && \
    pip install robotframework robotframework-seleniumlibrary

# Set the working directory
WORKDIR /robot

# Copy the Robot Framework test file into the container
COPY /projetos/template/template.robot /robot/template.robot

# Define the volume
VOLUME /robot

# Default command to run (optional)
CMD ["robot", "template.robot"]
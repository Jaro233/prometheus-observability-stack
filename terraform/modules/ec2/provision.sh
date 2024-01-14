#!/bin/bash

# Update and install required packages
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Set up the Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package database
sudo apt-get update

# Install Docker CE
sudo apt-get install -y docker-ce

# Add 'ubuntu' user to the 'docker' group
sudo usermod -aG docker ubuntu

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Apply the new group membership (user needs to log out and back in)
# This command will not return a prompt, it is intended to be run at the end of a provisioning script
# If running this command manually, you should log out and back in after execution
sudo newgrp docker

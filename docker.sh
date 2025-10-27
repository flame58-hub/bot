#!/bin/bash

# Remove any broken Docker source list
sudo rm -f /etc/apt/sources.list.d/docker.list

# Make sure the keyrings directory exists
sudo mkdir -p /usr/share/keyrings

# Download and add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the Docker repository (replace 'jammy' with your Ubuntu version if needed)
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update apt
sudo apt-get update

# Install Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Print Docker version to verify installation
docker --version

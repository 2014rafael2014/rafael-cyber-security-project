#!/bin/bash

# Update package lists
sudo apt update

# Install unzip (required to unpack Terraform binary)
sudo apt install unzip -y

# Download the latest stable Terraform binary for Ubuntu amd64 architecture
LATEST_URL=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[] | select(.os == "linux" and .arch == "amd64") | .url')
curl -o /tmp/terraform.zip $LATEST_URL

# Extract the downloaded archive
unzip /tmp/terraform.zip -d /tmp

# Move the terraform binary to a directory in your PATH (e.g., /usr/local/bin)
sudo mv /tmp/terraform /usr/local/bin/

# Check Terraform version to confirm successful installation
terraform --version

# Optionally, add /usr/local/bin to your PATH permanently (modify if using a different directory)
# echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bashrc
# source ~/.bashrc

echo "Terraform installation complete!"
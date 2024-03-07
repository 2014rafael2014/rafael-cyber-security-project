#!/bin/bash

# Update apt package index and install required dependencies
sudo apt update
sudo apt install -y unzip wget

# Download the latest version of Terraform for Linux/amd64
TERRAFORM_VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Unzip the downloaded package
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Move Terraform binary to /usr/local/bin directory
sudo mv terraform /usr/local/bin/

# Verify Terraform installation
terraform --version

# Clean up downloaded zip file
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

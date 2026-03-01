#!/bin/bash
set -e

# Install MySQL
sudo apt update
sudo apt install -y mysql-client

# Install SSL Cert
sudo mkdir -p /certs
cd /certs
sudo wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
chmod 644 /certs/global-bundle.pem
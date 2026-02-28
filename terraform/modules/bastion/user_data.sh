#!/bin/bash
set -e

yum update -y

# Install PMySQL clients
yum install -y mysql
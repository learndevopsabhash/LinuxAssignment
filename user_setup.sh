#!/bin/bash

# Script must run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

echo "Creating users Sarah and Mike..."

# Create users
useradd -m Sarah
useradd -m mike

# Set passwords
echo "Sarah:Secure@123" | chpasswd
echo "mike:Secure@123" | chpasswd

echo "Users created and passwords set."

# Create workspace directories
mkdir -p /home/Sarah/workspace
mkdir -p /home/mike/workspace

# Set ownership
chown Sarah:Sarah /home/Sarah/workspace
chown mike:mike /home/mike/workspace

# Set permissions 700
chmod 700 /home/Sarah/workspace
chmod 700 /home/mike/workspace

echo "Workspace directories created."

# Set password expiry policy
chage -M 30 Sarah
chage -l Sarah

chage -M 30 mike
chage -l mike

echo "Password expiry set to 30 days."

echo "User setup completed successfully."

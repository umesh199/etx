#!/bin/bash

# Install packages if not already present
microdnf install -y \
    iputils \
    net-tools \
    traceroute \
    curl \
    wget \
    openssh-server \
    passwd \
    hostname

# Set root password
echo "root:redhat" | chpasswd

# SSH configuration
mkdir -p /var/run/sshd
sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Start SSH
/usr/sbin/sshd -D

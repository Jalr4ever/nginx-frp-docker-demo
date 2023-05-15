#!/bin/sh

# Flush all existing rules
iptables -F

# Set default policy to DROP
iptables -P INPUT DROP

# Allow traffic from subnet_b
iptables -A INPUT -s 178.20.0.40 -j ACCEPT

# Save firewall rules
mkdir -p /etc/iptables
iptables-save > /etc/iptables/rules.v4

# Execute CMD
exec "$@"


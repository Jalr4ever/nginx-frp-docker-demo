#!/bin/sh

# Flush all rules and counters
iptables -F
iptables -X

# Set default policy to drop all incoming traffic
iptables -P INPUT DROP

# Set default policy to allow all outgoing traffic
iptables -P OUTPUT DROP

# Allow traffic to frps 7200 port & application port 80
iptables -A OUTPUT -p tcp --dport 7200 -j ACCEPT
iptables -A OUTPUT -p udp --dport 7200 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p udp --dport 80 -j ACCEPT

# Allow established connections to return
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT

# Save the rules
iptables-save > /etc/iptables/rules.v4

# Execute CMD
exec "$@"


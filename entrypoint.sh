#!/bin/sh

set -e

# enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# configure firewall
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
modprobe nf_conntrack_pptp

exec "$@"

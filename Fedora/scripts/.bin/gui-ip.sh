#!/bin/env bash

# Command output to show on gui
# about IP addresses information

IFACE="wlp2s0"
local_ip="$(ip -br a | grep $IFACE | awk '{print $3}')"
public_ip="$(curl -s icanhazip.com)"

printf "Local: ${local_ip}\nPublic: ${public_ip}"

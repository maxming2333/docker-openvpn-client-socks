#!/bin/sh

CONFIG_FILE="${OPENVPN_CONFIG}"
if [ "$CONFIG_FILE" = "" ]; then
  CONFIG_FILE="/etc/openvpn/client.conf"
fi

echo "openvpn config file: $CONFIG_FILE"

cd /etc/openvpn/

/usr/sbin/openvpn --config "${CONFIG_FILE}" --script-security 2 --setenv "SS_COMMAND" "${SS_COMMAND}" --setenv "SS_CONFIG" "${SS_CONFIG}" --up "/usr/local/bin/sockd.sh"

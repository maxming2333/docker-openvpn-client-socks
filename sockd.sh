#!/bin/sh

[ -f /etc/openvpn/up.sh ] && /etc/openvpn/up.sh "$@"

COMMAND_FILE="${SS_COMMAND}"
if [ "$COMMAND_FILE" = "" ]; then
  COMMAND_FILE="ss-server"
fi

CONFIG_FILE="${SS_CONFIG}"
if [ "$CONFIG_FILE" = "" ]; then
  CONFIG_FILE="/etc/shadowsocks-libev/config.json"
fi

COMMAND_FILE="/usr/bin/${COMMAND_FILE}"
if [ ! -f "$COMMAND_FILE" ]; then
  echo "can't find file: $COMMAND_FILE"
fi

echo "shadowsocks-libev command file: $COMMAND_FILE"
echo "shadowsocks-libev config file: $CONFIG_FILE"

"${COMMAND_FILE}" -c "${CONFIG_FILE}" -v

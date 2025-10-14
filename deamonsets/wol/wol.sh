#!/bin/sh

# Target IPs and corresponding MAC addresses for Wake-on-LAN
TARGETS="ip1 ip2"
MACS="mac1 mac2"

# Determine the network interface for the default route
IFACE=$(ip route show default 0.0.0.0/0 | head -n1 | awk '{print $5}')
# Fallback interface determination (e.g., if the host is using a different routing setup)
[ -z "$IFACE" ] && IFACE=$(ip link show | awk -F': ' '/^[0-9]+: e/{print $2; exit}')
echo "$(date) WOL script started on interface: $IFACE"

while true; do
    i=1
    for IP in $TARGETS; do
        MAC=$(echo $MACS | cut -d' ' -f$i)
        if ! ping -c 2 -W 2 $IP >/dev/null 2>&1; then
            ether-wake -i $IFACE $MAC
            sleep $((RANDOM % 30))
            echo "$(date) [$HOSTNAME] Host $IP offline. Sending WOL to $MAC via $IFACE..."
        fi
        i=$((i + 1))
    done
    sleep 300
done

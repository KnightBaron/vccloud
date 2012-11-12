# Update Frontend & VM-Container firewall
rocks add network tap0 10.10.0.0 255.255.0.0 servedns=false
rocks add network tap1 10.10.0.0 255.255.0.0 servedns=false
rocks add network vpnbr0 10.10.0.0 255.255.0.0 servedns=false
rocks add host interface frontend tap0 subnet=tap0
rocks add host interface frontend tap1 subnet=tap1
rocks add host interface frontend vpnbr0 subnet=vpnbr0
rocks add firewall appliance=frontend rulename=MASQUERADE_TAP0 action=MASQUERADE chain=POSTROUTING network=all output-network=tap0 protocol=all service=nat
rocks add firewall appliance=frontend rulename=ACCEPT_VPN action=ACCEPT chain=INPUT network=all protocol=udp service=1194
rocks add firewall appliance=frontend rulename=ACCEPT_VPN_TAP0 action=ACCEPT chain=INPUT network=tap0 protocol=all service=all
rocks add firewall appliance=frontend rulename=ACCEPT_VPN_TAP1 action=ACCEPT chain=INPUT network=tap1 protocol=all service=all
rocks add firewall appliance=frontend rulename=ACCEPT_VPN_VPNBR0 action=ACCEPT chain=INPUT network=vpnbr0 protocol=all service=all
rocks add firewall appliance=frontend rulename=FORWARD_VPN_VPNBR0 action=ACCEPT chain=FORWARD network=vpnbr0 protocol=all service=all
rocks sync host sharedkey
rocks sync host firewall
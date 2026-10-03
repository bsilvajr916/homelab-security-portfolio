# Firewall Policy Example

This public example documents policy intent rather than exporting live firewall files.

## Hypervisor
- inbound default: DROP
- outbound default: ACCEPT
- allow trusted management network to SSH and hypervisor management UI
- allow DHCP only on the isolated lab bridge

## Core services VM
- inbound default: DROP
- allow trusted LAN to SSH, source-control web/SSH, and approved management UI
- keep database ports container-internal

## Controller VM
- inbound default: DROP
- allow trusted LAN SSH
- allow Tailscale transport
- keep AI/control-plane application services loopback or overlay-network only
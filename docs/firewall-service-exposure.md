# Firewall & Service Exposure

The infrastructure uses layered filtering and a default-deny management-plane design.

## Controls
- default-deny inbound policy on the hypervisor
- default-deny virtual-NIC policies on management/service VMs
- guest UFW where appropriate
- container-network isolation
- loopback/Tailscale-only binding for internal control-plane services

## Validation

Required ports are tested from an independent LAN host.

The same test verifies that representative unnecessary services remain blocked, including:
- database ports that should stay container-internal
- unused management ports
- rpcbind after NFSv4 validation

The lab also validates firewall configuration drift separately from live reachability.
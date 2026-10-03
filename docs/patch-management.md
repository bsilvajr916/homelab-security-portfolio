# Patch Management

The patch workflow is designed to limit blast radius and prove service recovery after updates.

## Workflow
1. record current services and failed units
2. refresh package metadata
3. simulate the full upgrade
4. confirm no unexpected removals
5. patch one system at a time
6. validate services before reboot
7. reboot when a new kernel is installed
8. verify the new running kernel
9. verify service endpoints, mounts, firewall state, and pending updates

This process was exercised across the hypervisor and infrastructure VMs, including container-host updates and a controlled hypervisor reboot.
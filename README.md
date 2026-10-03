# Proxmox Security & Infrastructure Homelab

A practical homelab project focused on Linux administration, virtualization, networking, security hardening, automation, backup/recovery, and AI-assisted infrastructure operations.

## What this project demonstrates

- Proxmox VE virtualization and VM lifecycle management
- Linux administration across Debian and Ubuntu systems
- segmented virtual networking and an isolated security-lab bridge
- default-deny firewall design and service-exposure validation
- SSH hardening and key-based administration
- patch management with post-reboot validation
- backup integrity checks and tested historical file recovery
- Git-backed infrastructure documentation
- deterministic validation of AI-assisted infrastructure work

## Core systems

| Role | Purpose |
| --- | --- |
| Proxmox host | virtualization, bridges, firewalling, backup orchestration |
| Core services VM | Git service, database, container management |
| Controller VM | administration, automation, health checks, AI support |
| Dev workstation VM | on-demand Linux development and automation |
| Project storage VM | NFS/SMB shared storage and recovery source |
| CyberOps VM | isolated security-lab workstation |

## Security model

The lab is private by design. Management and application services are restricted to trusted internal networks, while the security-lab network is isolated from normal infrastructure.

Controls include:

- default-deny inbound firewall policies
- key-based SSH
- restricted service exposure
- disabled unnecessary listeners
- repeatable firewall and SSH validation
- isolated security-lab routing
- backup and restore testing

## AI-assisted operations

The controller includes a bounded local-AI support layer for repository retrieval, documentation, troubleshooting, log analysis, automation support, and security review.

AI recommendations do not count as proof of system state. Infrastructure-impacting work follows:

`context/recommendation → explicit change → deterministic validation → documentation`

See [AI-Assisted Infrastructure Operations](docs/ai-assisted-operations.md).

## Evidence

- [Architecture](docs/architecture.md)
- [Network & security segmentation](docs/network-security.md)
- [Technology inventory](docs/technology-inventory.md)
- [SSH hardening](docs/ssh-hardening.md)
- [Firewall and service exposure](docs/firewall-service-exposure.md)
- [Patch management](docs/patch-management.md)
- [Backup and restore](docs/backup-recovery.md)

## Validation examples

Public-safe examples are under:

- `configs/ssh/`
- `configs/firewall/`
- `scripts/`

The public repository intentionally excludes credentials, private keys, tokens, certificates, private application state, and private Git history.
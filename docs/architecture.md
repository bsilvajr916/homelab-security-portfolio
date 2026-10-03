# Architecture

## System architecture

```mermaid
flowchart TB
    Internet((Internet))
    Router["Home Router / Gateway"]
    PVE["Proxmox VE\nVirtualization • Firewall • Backup Orchestration"]

    Internet --> Router --> PVE

    subgraph LAN["Trusted Infrastructure LAN"]
        Core["Core Services VM\nForgejo • PostgreSQL • Portainer"]
        Controller["Controller VM\nAutomation • Health Checks\nProject Brain • Bionic • Serena"]
        Dev["Dev Workstation VM\nOn-demand Linux Dev / Automation"]
        Storage["Project Storage VM\nNFSv4 • SMB • Project Data"]
    end

    PVE --- LAN

    subgraph RANGE["Isolated Cyber-Range Bridge\nNo Physical Uplink"]
        Cyber["CyberOps VM\nFuture Security-Lab Workstation"]
    end

    PVE --- RANGE

    USB["Dedicated Backup Storage\nVM backups • Host config\nApplication backup • File history"]

    Storage -- "NFSv4" --> Controller
    Storage -- "NFSv4" --> Dev
    Storage -- "Backup source" --> PVE
    PVE --> USB

    Controller -. "SSH orchestration / validation" .-> PVE
    Controller -. "SSH orchestration / validation" .-> Core
    Controller -. "SSH orchestration / validation" .-> Dev
    Controller -. "SSH orchestration / validation" .-> Storage
```

## Network segmentation

```mermaid
flowchart LR
    Admin["Trusted Admin Device"]
    Trusted["Trusted Infrastructure LAN"]
    PVE["Proxmox Firewall / Bridges"]
    Cyber["Isolated Cyber Range"]
    Internet((Internet))

    Admin --> Trusted
    Trusted --> PVE
    PVE --> Cyber

    Admin -- "SSH / HTTPS management" --> PVE
    Trusted -- "Approved service ports only" --> Trusted
    Cyber -- "NAT: internet-bound traffic" --> Internet
    Cyber -. "RFC1918 access rejected" .-> Trusted
```

## Compute roles

- **Proxmox host** — hypervisor, virtual networking, firewalling, backup orchestration
- **Core services VM** — source control, database, container management
- **Controller VM** — administration, SSH orchestration, health checks, AI-assisted operations
- **Dev workstation VM** — on-demand Linux development and automation
- **Project storage VM** — shared NFS/SMB storage and recovery source
- **CyberOps VM** — future isolated security-lab workstation

## Storage and recovery

Recovery is layered:

1. VM-level backup for operating-system recovery
2. host/application configuration backup
3. file-level project-data mirror
4. changed/deleted-file history
5. checksum-based integrity validation
6. tested historical file restoration

## Design principle

New services are added only when they demonstrate a useful infrastructure, networking, automation, or cybersecurity skill.
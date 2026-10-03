# Network & Security Segmentation

The public diagram intentionally describes trust boundaries and allowed flows without publishing internal host addresses.

```mermaid
flowchart TB
    Admin["Trusted Admin Device"]
    Internet((Internet))

    subgraph HOST["Proxmox Host"]
        FW["Default-Deny Host / VM Firewall"]
        LANBridge["Management / Services Bridge"]
        CyberBridge["Isolated Cyber-Range Bridge\nNo Physical Uplink"]
    end

    subgraph TRUSTED["Trusted Infrastructure"]
        Core["Core Services"]
        Controller["Controller / Automation"]
        Dev["On-Demand Dev Workstation"]
        Storage["Project Storage"]
    end

    subgraph LAB["Security Lab"]
        CyberOps["CyberOps Workstation"]
        Targets["Future Vulnerable Targets"]
    end

    Admin -- "SSH / HTTPS management" --> FW
    FW --> LANBridge --> TRUSTED
    FW --> CyberBridge --> LAB

    Controller -- "SSH orchestration" --> Core
    Controller -- "NFSv4" --> Storage
    Dev -- "NFSv4" --> Storage

    LAB -- "NAT: internet-bound only" --> Internet
    LAB -. "RFC1918 infrastructure blocked" .-> TRUSTED
```

## Policy intent

- Infrastructure management is limited to trusted internal paths.
- Published container services are filtered at the Proxmox virtual-NIC edge.
- Database services remain container-internal.
- Controller application services are loopback- or overlay-network-bound.
- The security-lab bridge has no physical uplink.
- Lab traffic cannot freely reach normal private infrastructure.
- Unnecessary listeners are disabled when functionality is preserved.
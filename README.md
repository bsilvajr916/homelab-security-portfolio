# Proxmox Security & Infrastructure Homelab

This is my personal homelab project for getting hands-on experience with Linux, virtualization, networking, security, automation, and backup/recovery.


## Why I built this

I had an older PC sitting around collecting dust, and I wanted a practical way to start building the IT and cybersecurity skills I was learning about in school.

At first, I thought I would mostly use it for photo storage, school virtual machines, and learning Linux. Instead of leaving the machine unused, I turned it into a Proxmox homelab and started experimenting.

I did not start with a huge design planned out. I started with the basics and added pieces as I had a reason to learn them. That grew into Linux virtual machines, remote administration, shared storage, firewall rules, backups, recovery testing, automation, and an isolated security-lab network.

Over time, the project became more than just a way to reuse an old computer. It became a place where I could practice what I was learning, make mistakes safely, test changes, and document the results as a portfolio project.

### Starting hardware

The homelab grew out of three older computers and parts I already had available instead of buying a dedicated server.

The main Proxmox system is built around:

- AMD Ryzen 5 2600
- 32 GB RAM
- NVIDIA GTX 1050 Ti
- ASUS motherboard

The other repurposed systems have been useful as supporting machines for administration, development, testing, and lab work.

The point was not to build an expensive server. I wanted to see how much useful hands-on experience I could get out of hardware that was already sitting around.

I use documentation, testing, and technical tools to help me work through the lab. AI is one of those tools and is mainly used as a guide for explanations, troubleshooting ideas, script review, and documentation. I still verify important changes on the actual systems.

## How the project grew

The project developed a little at a time instead of being built from a finished blueprint:

1. **Reuse an old PC** — originally for photo storage, school VMs, and learning Linux.
2. **Install Proxmox** — turn one physical computer into a host for multiple virtual machines.
3. **Build separate VMs** — give different systems their own jobs instead of putting everything on one machine.
4. **Manage them remotely** — use SSH to administer Linux systems without opening each VM directly.
5. **Add shared services and storage** — centralize project files and source control.
6. **Harden the environment** — tighten SSH access, firewall rules, and network exposure.
7. **Add recovery and validation** — create backups, test restores, and write repeatable checks.
8. **Document the result** — turn the lab into a portfolio project that shows the work and what I am learning.

## What clicked for me

One of the first moments where the project really clicked was when I had several VMs running and could SSH into each one remotely.

Before that, virtualization was mostly an abstract idea to me. Seeing one physical computer act like several separate machines, with each machine having its own role and being able to communicate over the network, made the whole idea feel real.

That was the point where I realized I was not just setting up an old PC anymore. I was building a small environment where I could practice how servers and networks actually work together.

## What I am most proud of

I am most proud of how far the project grew from the original idea.

It started as an old PC that I thought might be useful for storage and a few school VMs. It now has separate systems for services, administration, development, and storage, along with remote management, security controls, backups, and recovery testing.

I am still learning the technology behind it, but building the environment has given me a real system to learn from instead of only reading about these concepts.

## What I worked on

- running multiple Linux virtual machines with Proxmox
- managing Linux systems remotely with SSH
- replacing password-based SSH access with key-based access
- using default-deny firewall rules and testing which services are reachable
- separating normal infrastructure from an isolated security-lab network
- running Forgejo, PostgreSQL, and Portainer with Docker
- setting up shared NFS/SMB project storage
- updating the systems one at a time and checking services after reboots
- creating backups and proving that an older file version could actually be restored
- using Git to document changes and keep the project organized
- writing repeatable checks for SSH, firewall rules, service exposure, and backup health

## Project ownership

This is my lab and my learning project. I decide what belongs in it, what security changes to make, and what I want to learn from it.

When I need help, I use normal technical resources such as documentation, testing tools, and AI assistance. AI is used more like a technical assistant or guide for explanations, troubleshooting ideas, and review. I still verify important results on the actual systems before I count the work as complete.

That verification includes things like:

- fresh SSH login tests
- firewall reachability checks
- service health checks
- post-reboot checks
- backup integrity checks
- SHA-256 comparison after a restore

## Core systems

| Role | Purpose |
| --- | --- |
| Proxmox host | Runs the virtual machines, networking, firewall rules, and backups |
| Core services VM | Runs Forgejo, PostgreSQL, and Portainer |
| Controller VM | Used for administration, automation, health checks, and AI support |
| Dev workstation VM | Linux development and automation workstation that runs when needed |
| Project storage VM | Shared NFS/SMB project storage |
| CyberOps VM | Isolated security-lab workstation for future labs |

## Security model

The lab is private by design. Management and application services stay on trusted internal networks, and the security-lab network is kept separate from the normal infrastructure.

Some of the controls I set up and tested include:

- default-deny inbound firewall rules
- key-based SSH
- limited service exposure
- disabling unnecessary network services
- firewall and SSH verification scripts
- an isolated security-lab network
- backup and restore testing

## Technical assistance

AI is one of several tools I use for things like explanations, troubleshooting ideas, documentation, and reviewing scripts or configuration.

It is treated as an assistant, not as the source of truth for the environment. Important changes still have to be tested.

My general workflow is:

`understand the change → make the change → test it → document the result`

See [Use of AI as a Support Tool](docs/ai-assisted-operations.md).

## Project documentation

- [Architecture](docs/architecture.md)
- [Network & security segmentation](docs/network-security.md)
- [Technology inventory](docs/technology-inventory.md)
- [SSH hardening](docs/ssh-hardening.md)
- [Firewall and service exposure](docs/firewall-service-exposure.md)
- [Patch management](docs/patch-management.md)
- [Backup and restore](docs/backup-recovery.md)

## Example configs and checks

Public-safe examples are under:

- `configs/ssh/`
- `configs/firewall/`
- `scripts/`

The public repository does not include credentials, private keys, tokens, certificates, private application data, or my private Git history.

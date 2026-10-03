# SSH Hardening

The SSH baseline standardizes administrative access across infrastructure systems.

## Policy
- public-key authentication enabled
- password authentication disabled across administrative hosts after each key path was tested
- keyboard-interactive authentication disabled
- root authentication restricted to keys
- X11 forwarding disabled
- authentication attempts limited

## Change process
1. verify current key-based access
2. install a reusable sshd drop-in
3. run `sshd -t`
4. reload SSH
5. open a fresh key-authenticated session
6. re-read effective `sshd -T` settings
7. validate configuration drift automatically

A public-safe example is available at `configs/ssh/00-homelab-hardening.conf`.

The controller VM was hardened only after an external admin workstation successfully authenticated with its ED25519 key. A second fresh public-key login after the SSH reload confirmed that key-only access still worked with password authentication disabled.
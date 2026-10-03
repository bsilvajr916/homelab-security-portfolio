# Backup & Recovery

The recovery design separates operating-system recovery from project-data recovery.

## Layers
- VM-level hypervisor backups
- host-configuration archive
- application backup
- current project-data mirror
- changed/deleted-file history
- integrity verification

## Restore validation

A controlled file was:
1. backed up as version 1
2. modified to version 2
3. recovered from timestamped history
4. restored to project storage
5. verified by SHA-256 against the original version

The restored checksum matched the original exactly.

This proves the recovery path rather than only proving that backup files exist.
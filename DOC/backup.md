

A shoutout for attic https://attic-backup.org/
Attic is one of the new-generation hash-backup tools (like obnam, zbackup, Vembu Hive etc). It provides encrypted incremental-forever (unlike duplicity, duplicati, rsnapshot, rdiff-backup, Ahsay etc) with no server-side processing and a convenient CLI interface, and it does let you prune old backups.

Backups should be pulled from the backup box, not pushed from the original box. Pushing backups is only acceptable for consumer devices, and even then, only because we don't have a reliable way to pull data from them (due to frequently changing IP addresses, NAT, etc).

The backup box needs to be even more trustworthy than the original box, not the other way around. I'm willing to live with a significant amount of overhead, both in storage and in bandwidth, in order not to violate this principle.

The backup box, of course, could push encrypted data to untrusted storage, such as S3. But only after it has pulled from the original box. In both cases, the connection is initiated from the backup box, not the other way around. The backup box never accepts any incoming connection.



vaultwarden - Unofficial Bitwarden password manager server written in Rust

The web interface is accessible via port 8384:

http://libgen.is/book/index.php?md5=72CA0FD9B1CCF13AF510E2432DD4F0EA








(service rsync-service-type)


Data type representing the configuration for rsync-service.

package (default: rsync)
rsync package to use.

port-number (default: 873)
TCP port on which rsync listens for incoming connections. If port is less than 1024 rsync needs to be started as the root user and group.

pid-file (default: "/var/run/rsyncd/rsyncd.pid")
Name of the file where rsync writes its PID.

lock-file (default: "/var/run/rsyncd/rsyncd.lock")
Name of the file where rsync writes its lock file.

log-file (default: "/var/log/rsyncd.log")
Name of the file where rsync writes its log file.

use-chroot? (default: #t)
Whether to use chroot for rsync shared directory.

share-path (default: /srv/rsync)
Location of the rsync shared directory.

share-comment (default: "Rsync share")
Comment of the rsync shared directory.

read-only? (default: #f)
Read-write permissions to shared directory.

timeout (default: 300)
I/O timeout in seconds.

user (default: "root")
Owner of the rsync process.

group (default: "root")
Group of the rsync process.

uid (default: "rsyncd")
User name or user ID that file transfers to and from that module should take place as when the daemon was run as root.

gid (default: "rsyncd")
Group name or group ID that will be used when accessing the module.

The (gnu services syncthing) module provides the following services:

You might want a syncthing daemon if you have files between two or more computers and want to sync them in real time, safely protected from prying eyes.

Scheme Variable: syncthing-service-type
This is the service type for the syncthing daemon, The value for this service type is a syncthing-configuration record as in this example:

(service syncthing-service-type
         (syncthing-configuration (user "alice")))
See below for details about syncthing-configuration.

Data Type: syncthing-configuration
Data type representing the configuration for syncthing-service-type.

syncthing (default: syncthing)
syncthing package to use.

arguments (default: ’())
List of command-line arguments passing to syncthing binary.

logflags (default: 0)
Sum of logging flags, see Syncthing documentation logflags.

user (default: #f)
The user as which the Syncthing service is to be run. This assumes that the specified user exists.

group (default: "users")
The group as which the Syncthing service is to be run. This assumes that the specified group exists.

home (default: #f)
Common configuration and data directory. The default configuration directory is $HOME of the specified Syncthing user.
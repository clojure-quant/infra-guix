
# linux kernel version
uname -srm
Linux 5.14.9-gnu x86_64

# list kernel modules
less /proc/modules

# kernel log
sudo dmesg
for links errors.
/var/log/messages
they are syslog logs, awb99, and the kernel ‘dmesg’ is one of the things that it logs
--MARK-- ;   That's just syslog logging that it's still alive but there's nothing to say.

# old bug

wb99: Since the culprit is cpuidle_enter_state, you could try booting with ‘cpuidle.off=1’ first.

Add it to the (kernel-arguments (list "cpuidle.off=1" [stuff you might already have])).

awb99: This cpuidle_enter_state shows up in wildly different random bug reports over the decade (ZFS, …) where it's obviously not the culprit, but yours is interesting in that the call trace is rather short, and the idle subsystem may actually be to blame for once.  This is still just a guess though.  I'm not very familiar with that part of the kernel.  This is not related to Guix, so be sure to ask other channels (maybe #linux, if that's any good) if disablin It's also possible there are more specific error messages in the kernel log before that point.  The kernel logs ‘Linux version …’ every time it boots, everything between that & the stack trace you posted is from the same boot.








# CUPS PRINTING

http://localhost:631/
sudo herd restart cups
lp lpadmin group.


> And finally, judging by the output of "avahi-browse -avr", it seems
> that the Brother HL-L2390DW does not advertise an IPPS server, so it
> probably doesn't support TLS, which is unfortunate.

I was mistaken about this.  The Brother HL-L2390DW does support IPPS,
i.e. IPP over TLS.  However, it was not enabled by default, which is why
avahi-browse didn't find it.  This printer has an administrative web
interface reachable via a web browser.  You can log in and configure
lots of features, including TLS support for IPP printer queues.

I also learned that Debian has a lot of documentation regarding
printing.  The "driverless" printing looks especially promising:

https://wiki.debian.org/DriverlessPrinting

I've noticed that our package definition for cups-filters explicitly
passes the "--disable-driverless" option at configure time, with comment
that says "TODO: enable this".  Perhaps I will try doing that and see if
I can get Guix System printing over IPP just as nicely as PureOS.

PureOS, or should I say Debian, has some other neat features built in,
also.  They're documented on the above page.  For example, their CUPS is
configured to automatically create (driverless) PPD files on the fly
without requiring user interaction, which is really slick.  See
"Creating a Driverless Print Queue with cups-browsed" in the page linked
above for details.  On PureOS, I observed this automatic driverless PPD
creation in action, and it just worked.  It was quite impressive.

I feel a little more optimistic after reading Debian's description of
the future of driverless printing.  As for getting my scanner to work, I
think that's going to be a whole other can of worms…

A user can be assured of having such a device when it is network-capable and it is

AirPrint-certified, or

Mopria-certified.

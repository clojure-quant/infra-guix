
# Tailscale on a linux guix machine.

I wanted to use tailscale on guix. 
Since it is not in the guix repo I have created a custom 
[guix tailwind package](https://github.com/clojure-quant/infra-guix/blob/main/modules/awb99/package/tailscale.scm)
and a [custom tailwind service](https://github.com/clojure-quant/infra-guix/blob/main/modules/awb99/services/tailscale.scm).

The package definition relies on the nonguix channel. So you need to include it in your channels definitoon.

To use this package + service you can download the files and save them to 
your local disk and make sure it can be loaded by guile:

`export GUILE_LOAD_PATH=/home/john/scm`

If you this path then you need to save the package file as
/home/john/scm/awb99/package/tailwind.scm and 
the service file as /home/john/scm/awb99/service/tailwind.scm

The namespace (awb99 package tailwind) translates to awb99/package/tailwind.scm
you have to create the directories scm awb99 package/service.

A simple os declaration then would be:

```
(use-modules 
  (awb99 services tailscale))
(operating-system)
  ; your other os settings
  (packages (list (specification->package tailscale))
  (services (cons tailscale-service desktop-services)))
```

once your os is setup you can do `tailscale up` to connect the machine to your tailscale account 
and `tailscale status` to see if you are connected.

Ideas: if someone writes a tailscale package that uses the go build system
then this fould be submitted to guix directly.

My repo also contains a tailwind up service that automatically connects 
to tailwind on os start.





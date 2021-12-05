# pinkgorilla infra-guix

GNU GUIX is a package manager and/or an operating system that is configured via Guile (Scheme).
For GUIX installation see DOCS/foreign.md

## requirements

- guix installed (package manager (guix foreign) or guix operating system)
- babashka


## GUIX App bundle

We created a configuration to install all tools needed to 
run pinkgorilla notebook and to develop it.

Tools include:
- Clojure / Java / Leiningen 
- Node / Npm (for shadowcljs clojurescript builds)
- Python / R (for datascience)

Develop Pinkgorilla by using GUIX.

## Development

Admin Tool: To clone all pinkgorilla git repos to /home/pinkgorilla execute

```
./admin.sh gitclone            runs git clone on all repos that do not exist on disk

./admin.sh info 
./admin.sh info pinkie

./admin.sh gitstatus            git status for all reps
./admin.sh gitstatus pinkie     git status for pinkie repo

./admin.sh demo pinkie          run demo app git for pinkie repo
```

Create a virtual environment (can be exited with CTRL+D)
that only exports the apps/environment variables of the GUIX app bundle.
Therefore builds are guaranteed to be deterministic.

## Run Pinkgorilla Demos

Initial Install
```
mkdir /home/pinkgorilla
./admin.sh gitclone pinkie
```

To create the virtual environment
```
./dev-env.sh 

```

Inside the virtual environment:
```

# Enduser Apps and Examples
./admin.sh demo notebook-clj  
./admin.sh demo goldly-example-datascience 

# Developer Libraries
./admin.sh demo pinkie
./admin.sh demo webly
./admin.sh demo goldly
./admin.sh demo gorilla-ui
./admin.sh demo nrepl-middleware
          
          
```


## Docker 

GUIX can create Docker Images that could be run in a KVM cluster.

```
 ./docker-build.sh
 ./docker-start.sh
 ./docker-exec.sh
 ./docker-stop.sh
```

http://guix.gnu.org/en/packages/r-rserve-1.8-6/



## guix bugs

/usr/bin/env
karma test runner needs it. Create a symlink automatically
fix: run ./env.sh after guix env is created.

# python

PYTHON env variable: if python3 is installed in host, this variable
fucks up local apps that use python. I only install python in dev 
profile. so should not be an issue. solution: unset python in bashrc
or wait for update (which comes soon)

it will complain with “Permission denied” because it is trying to install in the (immutable) Guix store. Override with

pip3 install --user package-name


GIT SSL: if guest os has ssl issue with git:
git config --global http.sslverify false


tmux:
tmux: need UTF-8 locale (LC_CTYPE) but have ANSI_X3.4-1968
guix environment --container --ad-hoc glibc-utf8-locales tmux …
export GUIX_LOCPATH=$GUIX_ENVIRONMENT/lib/locale
or use the option --preserve.







;; auto mount usb drives ??

udevil


/var/log/messages
they are syslog logs, awb99, and the kernel ‘dmesg’ is one of the things that it logs
--MARK-- ;   That's just syslog logging that it's still alive but there's nothing to say.

wb99: Since the culprit is cpuidle_enter_state, you could try booting with ‘cpuidle.off=1’ first.

Add it to the (kernel-arguments (list "cpuidle.off=1" [stuff you might already have])).

awb99: This cpuidle_enter_state shows up in wildly different random bug reports over the decade (ZFS, …) where it's obviously not the culprit, but yours is interesting in that the call trace is rather short, and the idle subsystem may actually be to blame for once.  This is still just a guess though.  I'm not very familiar with that part of the kernel.  This is not related to Guix, so be sure to ask other channels (maybe #linux, if that's any good) if disablin It's also possible there are more specific error messages in the kernel log before that point.  The kernel logs ‘Linux version …’ every time it boots, everything between that & the stack trace you posted is from the same boot.

uname -srm
Linux 5.14.9-gnu x86_64



https://github.com/wting/autojump
Guix  autojump or fasd

https://github.com/clvv/fasd

guix install xrandr gsettings-desktop-schemas

xrandr --dpi 300
 I put this in my .xsession (it's not persisted)

rather, I invoke xrandr in my .xsession
and yes, I think you have to relogin to see changes
mine is in .xinitrc, but that's what runs my session

gsettings-compile-schema, use glib:bin

<apteryx> awb99: what I do with ratpoison is use xrandr to set the DPI via --dpi
-*- civodul hits ENOSPC, means it's been a busy day
<apteryx> and then hack the Xft.dpi value accordingly in .Xresources
<apteryx> and then the font sizes in a few places... it's a mess
<civodul> apteryx: that'd only work for old programs like xterm
<civodul> "normal apps" do client-side font rendering via gtk and all that
<apteryx> GTK uses .Xresources
<apteryx> (Xft.dpi)
<civodul> oh? nice
<apteryx> at least some GTK applications (Gimp correctly uses the xorg server's DPI setting)
<apteryx> but others such as Icecat don't
<apteryx> IIRC
<civodul> heh, so like you say, it's a mess :-)
<apteryx> when you're done configuring your DPI, you can start e.g. Inkscape,
 and see if an A4 sized document corresponds on your screen to the real thing.
<apteryx> by default xorg's dpi is 96 for compatibility with Windows (or something close)
-*- apteryx laughs
<apteryx> or perhaps s/windows/legacy systems/




{:tasks {a 1 b {:depends [a] :task (inc a)}}}
13:30 Uhr
$ bb run --prn a
1
$ bb run --prn b
2
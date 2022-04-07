

## WOFI = WAYLAND ROFI 

Currently wofi has 3 built in modes

1.
    run - searches $PATH for executables and allows them to be run by selecting them.
2.
    drun - searches $XDG_DATA_HOME/applications and $XDG_DATA_DIRS/applications for desktop files and allows them to be run by selecting them.
3.
    dmenu - reads from stdin and displays options which when selected will be output to stdout. 

In the event $XDG_DATA_HOME is not specified it defaults to ~/.local/share. If $XDG_DATA_DIRS is not specified it defaults to /usr/local/share:/usr/share.

Combi is not a mode however it does exist as a feature. You can use it by doing --show mode1,mode2,mode3,etc. You can mix and match any number of modes however each mode can only be loaded once so doing something like --show run,drun,run is not supported although I'm not sure why you'd do that in the first place.


## polybar




# dconf

https://askubuntu.com/questions/169704/how-to-search-dconf-for-keys-or-values
dconf dump / 
dconf dump / | grep SEARCH-TERM''

this shows only the values that were changed.

# dconf-editor
guix install dconf-editor
dconf-editor

 org.gnome.settings-daemon.plugins.power

dconf dump /


[org/gnome/desktop/sound]
allow-volume-above-100-percent=true

[org/gnome/settings-daemon/plugins/power]
sleep-inactive-ac-type='nothing'

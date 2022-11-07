
# udev

sudo herd doc udev list-actions

Führt udev aus, was zur Laufzeit Gerätedateien ins Verzeichnis /dev einfügt.
herd rules udev

ls /gnu/store/s1968693pp3zi1zs6l1lzcx6n37ih8kx-udev-rules/lib/udev/rules.d
sudo cat /gnu/store/s1968693pp3zi1zs6l1lzcx6n37ih8kx-udev-rules/lib/udev/rules.d/70-power-switch.rules

(simple-service 'custom-udev-rules udev-service-type (list sane-backends android-udev-rules)))

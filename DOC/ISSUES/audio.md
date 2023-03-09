

inxi -A | grep driver

sudo dmesg |grep audio
lspci |grep audio

sudo cat /var/log/messages |grep pulseaudio

pacmd list-cards
hwinfo –sound
guix install hwinfo

[   12.730764] sof-audio-pci-intel-tgl 0000:00:1f.3: Direct firmware load for intel/sof/sof-adl.ri failed with error -2
[   12.730766] sof-audio-pci-intel-tgl 0000:00:1f.3: error: sof firmware file is missing, you might need to
[   12.730767] sof-audio-pci-intel-tgl 0000:00:1f.3:        download it from https://github.com/thesofproject/sof-bin/
[   12.730768] sof-audio-pci-intel-tgl 0000:00:1f.3: error: failed to load DSP firmware -2

https://github.com/nonguix/nonguix


bluetooth
bluez-firmware

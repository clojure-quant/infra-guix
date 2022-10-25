


The majority of graphical applications use Fontconfig to locate and load fonts and perform X11-client-side rendering. The fontconfig package in Guix looks for fonts in $HOME/.guix-profile by default. Thus, to allow graphical applications installed with Guix to display fonts, you have to install fonts with Guix as well. Essential font packages include gs-fonts, font-dejavu, and font-gnu-freefont.


## fonts refresh

fc-cache -f
fc-cache -rv
to update the font cache 

# list installed fonts
fc-list

# fonts installed into a profile
ls /home/florian/.guix-extra-profiles/desktop/desktop/etc/fonts/conf.d
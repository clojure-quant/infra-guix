(define-module (awb99 packages fonts))

(define-public font-packages
  (list 
    "xsettingsd" ;; Settings Manager replaces daemons GNOME/XFCE - xsettingsd.conf
    "xdg-utils"
    "fontconfig" ; font loader for os; 
    "libxft" ; connect x to font-config

    ;; GTK Themes
    "hicolor-icon-theme"
  ;  "gnome-themes-standard"
    ;"gnome-themes-extra" ; lots of conflicts with gnome-themes-standard
    "adwaita-icon-theme" ;to make GTK applications look OK
    "arc-icon-theme"
    "matcha-theme"
   ; "gnome-icon-theme"
   ; "gnome-backgrounds"
    
    "papirus-icon-theme"
    "breeze-icons"




    ;; Fonts

    ; guix manual: essential fonts:
    "font-ghostscript" ; prior name:  "gs-fonts"
    "font-dejavu"  ; used in icecat
    "font-gnu-freefont" 
    
    "font-liberation" ; compatibility with Arial, Times New Roman, and Courier New.
    "font-adobe-source-code-pro" ; UI font.

     "font-fira-code" ; Mozilla Fonts
     "font-fira-mono" "font-fira-sans"

    "font-hack" ; a code font
    "font-iosevka" ; used in alacritty. Ideal font for programming
    "font-iosevka-etoile"
    "font-iosevka-aile"
    ;"font-iosevka-term"
    ;"font-iosevka-term-slab"
    ;"font-iosevka-slab"
    ; "font-iosevka-curly"
    ; "font-iosevka-curly-slab"
    "font-jetbrains-mono"   
   
    "font-google-noto"  ; 700 mb android default,Material ui
    "font-google-material-design-icons"
    "font-google-roboto"

    "font-openmoji"
    "font-awesome"
    "font-wqy-microhei" 

    "font-gnu-unifont" 
    "font-abattis-cantarell"
    "font-ibm-plex"
    "font-wqy-microhei"

;; lots of fonts from package fonts.scm
;font-adobe-source-code-pro font-adobe-source-han-sans
;font-adobe-source-sans-pro font-adobe-source-serif-pro
;font-anonymous-pro font-anonymous-pro-minus font-awesome
;font-bitstream-vera font-blackfoundry-inria font-cantarell
;font-cns11643 font-cns11643-swjz font-comic-neue font-culmus
;font-dejavu font-dosis font-dseg font-fantasque-sans font-fontna-yasashisa-antique
;font-gnu-freefont font-gnu-freefont-ttf font-gnu-unifont font-go
;font-google-material-design-icons font-google-noto font-google-roboto
;font-hack font-hermit font-ibm-plex font-inconsolata font-iosevka
;font-iosevka-aile font-iosevka-etoile font-iosevka-slab
;font-iosevka-sparkle font-iosevka-term font-iosevka-term-slab
;font-ipa-mj-mincho font-jetbrains-mono font-lato font-liberation
;font-linuxlibertine font-lohit font-meera-inimai font-mononoki
;font-mplus-testflight font-open-dyslexic font-opendyslexic
;font-public-sans font-rachana font-sarasa-gothic font-sil-andika
;font-sil-charis font-sil-gentium font-tamzen font-terminus
;font-tex-gyre font-ubuntu font-un font-vazir font-wqy-microhei
;font-wqy-zenhei
;; lots of fonts from package xorg.scm
;font-adobe100dpi font-adobe75dpi font-cronyx-cyrillic font-dec-misc
;font-isas-misc font-micro-misc font-misc-cyrillic font-misc-ethiopic
;font-misc-misc font-mutt-misc font-schumacher-misc
;font-screen-cyrillic font-sony-misc font-sun-misc font-util
;font-winitzki-cyrillic font-xfree86-type1

;the Gentium font family by SIL is packaged under the name font-sil-gentium.



    ))



;ix font support in Chromium
;xset +fp $(dirname $(readlink -f ~/.guix-profile/share/fonts/truetype/fonts.dir))


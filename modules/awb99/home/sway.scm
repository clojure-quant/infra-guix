(define-module (awb99 home sway)
#:use-module (srfi srfi-1)
#:use-module (guix gexp)
#:use-module (gnu home services)
;#:use-module (gnu home-services wm)
;#:use-module (awb99 home i3blocks)
;#:use-module (home services mako)
;#:use-module (home services swappy)
#:use-module (gnu packages gnupg)
;#:use-module (kreved packages wm)
)

; sway: Wayland compositor compatible with i3
; the difference is that now GDM supports wayland session although you can run X apps in it using Xwayland
; https://wiki.archlinux.org/title/Sway
; https://gitlab.com/rolas978/guix-sway/-/blob/master/guix-sway-config.scm
; https://www.reddit.com/r/GUIX/comments/epckio/gnu_system_with_wayland_and_sway/?utm_medium=android_app&utm_source=share
; https://notabug.org/jbranso/cheatsheets/src/master/guix.org  sway notes
; https://notabug.org/jbranso/guix-config/src/master/sway-service.scm
; see also: sway follws i3 config
; https://github.com/JensAc/dotfiles/blob/master/.config/i3/config

;
; https://github.com/Manjaro-Sway/desktop-settings/blob/sway/community/sway/etc/sway/modes/default
; https://github.com/Manjaro-Sway/desktop-settings/blob/sway/community/sway/etc/sway/config.d/98-application-defaults.conf

; https://www.fosskers.ca/en/blog/wayland


(define ws-bindings
(map (lambda (ws)
       `(,(string->symbol (format #f "$mod+~d" ws))
         workspace number ,ws))
     (iota 9 1)))

(define ws-move-bindings
(map (lambda (ws)
       `(,(string->symbol (format #f "$mod+Shift+~d" ws))
         move container to workspace number ,ws))
     (iota 9 1)))

(define-public sway-services
(list
 (service home-sway-service-type
  (home-sway-configuration
   ;; package does not work.
   ;;(package sway)
   ;; (package sway-next) ; no substitutes
   (config
    `((set $mod Mod4)
      (set $left Left)
      (set $right Right)
      (set $up Up)
      (set $down Down)

      (set $term alacritty)
      (set $menu bemenu-run
           --prompt "'run:'"
           --ignorecase)

      (set $wmenu 
          "wofi --show run")
 
 ;    bindsym Mod1+Tab exec --no-startup-id "rofi -show window"
 ;    bindsym Mod1+Return exec --no-startup-id "rofi -terminal xfce4-terminal -show ssh" 

      (bindsym
       --to-code
       (($mod+Return exec $term)
     
        ($mod+space exec $wmenu)
        ($mod+Shift+space exec $menu)

        ($mod+s exec "wofi --show ssh")
        ($mod+w exec "wofi --show window")

        ($mod+c kill)
        ($mod+q reload)
        ($mod+Shift+q exec swaymsg exit)

        ($mod+$up focus prev)
        ($mod+$down focus next)
        ($mod+Shift+$left move left)
        ($mod+Shift+$right move right)
        ($mod+Shift+$up move up)
        ($mod+Shift+$down move down)
        ($mod+f fullscreen)
        ($mod+Tab layout toggle split tabbed)
        ($mod+Shift+Tab split toggle)                          
        ($mod+grave floating toggle)
        ($mod+Shift+grave focus mode_toggle)
        ($mod+Shift+s exec "grim -g \"$(slurp)\" - | swappy -f -")
        (Print exec "grim - | wl-copy -t image/png")
        ($mod+g exec makoctl dismiss --all)
        ($mod+m exec makoctl set-mode dnd)
        ($mod+Shift+m exec makoctl set-mode default)
        ($mod+o exec "ykman oath list | bemenu --prompt 'otp:' --ignorecase | xargs -I {} -r ykman oath code -s '{}' | wl-copy")
        ,@ws-bindings
        ,@ws-move-bindings))

      (bindsym
       --locked
       ((XF86MonBrightnessUp exec light -A 10)
        (XF86MonBrightnessDown exec light -U 10)))

    ; This will lock your screen after 300 seconds of inactivity, then turn off
    ; your displays after another 300 seconds, and turn your screens back on when
    ; resumed. It will also lock your screen before your computer goes to sleep.

      (exec swayidle -w
            before-sleep "'swaylock -f -c 000000'"
            timeout 300 "'swaylock -f -c 000000'"
            timeout 600 "'swaymsg \"output * dpms off\"'"
            resume "'swaymsg \"output * dpms on\"'")
      (exec wlsunset -l 50.6 -L 36.6 -T 6500 -t 3000)
      (exec mako)

      ; only enable this if every app you use is compatible with wayland
      (xwayland enable)

      (workspace_auto_back_and_forth yes)
      (focus_follows_mouse no)
      (smart_borders on)
      (title_align center)

;
;   output HDMI-A-1 resolution 1920x1080 position 1920,0
; You can get the names of your outputs by running: swaymsg -t get_outputs

; Default wallpaper
;    (output * bg ,(local-file "files/wp.jpg") fill)
    ; (output eDP-1 scale 1.33)
  ; The scale factor can be fractional, but it is usually 2 for HiDPI screens.
  (output * scale 1.0)   
  ;(output DP-2 scale 1.0)
  ; (output eDP-1 scale 2.0)


; You can get the names of your inputs by running: swaymsg -t get_inputs
; Read `man 5 sway-input` for more information about this section.
; input type:keyboard xkb_layout "us"

    ; (input * xkb_layout "dvorak")

      (input "1118:1874:Microsoft_Wired_Keyboard_400"
             ((xkb_layout at)
            ;  (xkb_options grp:toggle)
            )) ; grp:toggle,ctrl:swapcaps 
      (input type:touchpad events disabled)
      (input "2:10:TPPS/2_IBM_TrackPoint"
             ((pointer_accel 0.3)
              (scroll_factor 0.8)))
      (input "1390:268:ELECOM_TrackBall_Mouse_HUGE_TrackBall"
             ((scroll_method on_button_down)
              (scroll_button BTN_TASK)))

      ; [instance="lxappearance"]
      ; [app_id="xsensors"]
      ; [title="Save File"]
      ; [app_id="thunderbird" title=".*Reminder"]

      ; launch some application at startup
      (exec "--no-startup-id alacritty")

      (assign "[app_id=\"nyxt\"]" 2)
     
      (assign "[instance=\"chromium\"]" 2)
      (assign "[app_id=\"chromium\"]" 2)
      (assign "[class=\"chromium/Chromium\"]" 2)

      (assign "[app_id=\"codium\"]" 3)
      (assign "[instance=\"codium\"]" 3)

      (assign "[instance=\"emacs\"]" 4)
      (assign "[app_id=\"telegramdesktop\"]" 5)

      (for_window
       "[app_id=\"telegramdesktop\" title=\"Media viewer\"]"
       focus)
      (for_window
       "[app_id=\"^.*\"]"
       inhibit_idle fullscreen)
      (for_window
       "[title=\"^(?:Open|Save) (?:File|Folder|As).*\"]"
       floating enable, resize set width 70 ppt height 70 ppt)

      (font "Iosevka, Light 14")
      (client.focused "#f0f0f0" "#f0f0f0" "#721045" "#721045" "#721045")
      (client.unfocused "#ffffff" "#ffffff" "#595959")
      (default_border normal 0)
      (default_floating_border none)
      (gaps inner 0) ; was 8

      
      (seat * xcursor_theme Adwaita 24)

      (bar
       ((status_command i3blocks)
        (position top)
        (separator_symbol "|")
        (font "Iosevka, Light 18")
        (pango_markup enabled)
        (colors
         ((statusline "#000000")
          (background "#FFFFFF")
          (focused_workspace "#f0f0f0" "#f0f0f0" "#721045")
          (inactive_workspace "#ffffff" "#ffffff" "#595959")))))))))

 ;(service
 ; home-i3blocks-service-type
 ; (home-i3blocks-configuration
 ;  (config
 ;   `((battery1
 ;      ((command . ,(local-file "files/battery" #:recursive? #t))
 ;       (BAT_NUM . 1)
 ;       (interval . 10)))
 ;     (battery0
 ;      ((command . ,(local-file "files/battery" #:recursive? #t))
 ;       (BAT_NUM . 0)
 ;       (interval . 10)))
 ;     (date
 ;      ((command . "date '+%a, %d %b'")
 ;       (interval . 1)))
 ;     (time
 ;      ((command . "date +%H:%M:%S")
 ;       (interval . 1)))))))


))

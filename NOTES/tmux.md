

## tmux
tmux: need UTF-8 locale (LC_CTYPE) but have ANSI_X3.4-1968
guix environment --container --ad-hoc glibc-utf8-locales tmux …
export GUIX_LOCPATH=$GUIX_ENVIRONMENT/lib/locale
or use the option --preserve.

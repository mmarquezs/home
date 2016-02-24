#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
if [ "GLaDOS" = $HOSTNAME ]; then
    xrandr --output DVI-I-0 --mode 1280x1024 --rate 60 --right-of DVI-D-0 \
    --output DVI-D-0 --mode 1920x1080 --rate 60 --primary --output HDMI-0 --mode \
    1920x1080 --right-of DVI-I-0 --dpi 96 \
fi;

exec i3
exec sleep 30
exec setxkbmap -model pc104 -layout es
if [ "morality" = $HOSTNAME ]; then
    exec synergyc 192.168.1.40
fi;

exec xcape -e 'Control_L=Escape'

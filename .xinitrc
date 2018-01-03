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

xrdb -load ~/.Xresources

#xset -dpms
#xset s off
#xset noblank
#xset r rate 200 20

#xmodmap -e 'clear lock'

#udiskie &

#exec /usr/bin/nvidia-settings --assign "CurrentMetaMode=DPY-6: 2560x1440_144 @2560x1440 +2560+1440 {ViewPortIn=2560x1440, ViewPortOut=2560x1440+0+0}, DPY-1: 2560x1440_60 @2560x1440 +2560+0 {ViewPortIn=2560x1440, DViewPortOut=2560x1440+0+0}, DPY-2: 2560x1440_144 @2560x1440 +5120+1440 {ViewPortIn=2560x1440, ViewPortOut=2560x1440+0+0}, DPY-4: 2560x1440_144 @2560x1440 +0+1440 {ViewPortIn=2560x1440, ViewPortOut=2560x1440+0+0}"

#/usr/bin/SetScreens

exec /usr/bin/i3 >~/i3log-$(date +'%F-%k-%M-%S') 2>&1

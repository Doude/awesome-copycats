#!/bin/sh

# Setup PATH
export PATH=$HOME/bin:/sbin:/usr/local/sbin:/usr/sbin:/bin:/usr/local/bin:/usr/bin:/usr/local/games:/usr/games

# Setup locale
export LANG=fr_FR.utf8
export LC_MESSAGES=en_US.utf8

# Ensure we use the appropriate gtkrc-2.0 file
export GTK2_RC_FILES=$HOME/.gtkrc-2.0

#export GDK_SCALE=2

xrandr --output eDP1 --auto --dpi 220

/usr/bin/ssh-add $HOME/.ssh/id_rsa < /dev/null
. /home/doude/.config/awesome/bin/xsettingsd-setup
/home/doude/.config/awesome/bin/xss-lock start &
#inputplug -0 -c ~/.config/awesome/bin/input-event 2> /dev/null
rfkill unblock bluetooth 2> /dev/null
blueman-applet 2> /dev/null &
xbacklight = 60 2> /dev/null
# redshift-gtk 2> /dev/null &
# [ -x /usr/sbin/rfkill ] && rfkill unblock 0 2> /dev/null
# [ -x /usr/sbin/rfkill ] && rfkill block 1 2> /dev/null
# [ -x /usr/bin/xbacklight ] && xbacklight = 60 2> /dev/null
# [ -x /usr/bin/redshift ] && redshift -l 2.3508:48.8567 -t 6500:5500 2> /dev/null &
# [ -x /usr/bin/slack ] && slack 2> /dev/null &
xbindkeys

compton --daemon --backend glx --xrender-sync-fence --vsync --paint-on-overlay
exec awesome

#!/bin/sh
DG_CURRENT_DESKTOP=ubuntu:GNOME
GDMSESSION=gnome-shell
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/
GDK_DPI_SCALE=0.66
gsettings set org.gnome.desktop.interface scaling-factor 0.9
gsettings set org.gnome.desktop.interface text-scaling-factor 1
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <0.9>}"
dconf write /org/gnome/desktop/interface/cursor-size 25

sed -i "s/export GDK_SCALE=.*/export GDK_SCALE=0.9/g" ~/.profile
sed -i "s/export GDK_DPI_SCALE=.*/export GDK_DPI_SCALE=0.9/g" ~/.profile
sed -i "s/export QT_AUTO_SCREEN_SCALE_FACTOR=.*/export QT_AUTO_SCREEN_SCALE_FACTOR=0.6/g" ~/.profile

xrandr --output DP-3 --off --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --dpi 96 --output eDP-1 --off --output DP-2 --off

xrdb ~/.Xdefaults
xrdb ~/.Xresources

xrandr --dpi 96

i3-msg restart

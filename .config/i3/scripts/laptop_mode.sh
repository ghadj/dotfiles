#!/bin/sh
DG_CURRENT_DESKTOP=ubuntu:GNOME
GDMSESSION=gnome-shell
export GIO_EXTRA_MODULES=/usr/lib/x86_64-linux-gnu/gio/modules/
GDK_DPI_SCALE=1.2
gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.desktop.interface text-scaling-factor 2
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor':   <2>}"

sed -i "s/export GDK_SCALE=.*/export GDK_SCALE=2/g" ~/.profile
sed -i "s/export GDK_DPI_SCALE=.*/export GDK_DPI_SCALE=0.5/g" ~/.profile
sed -i "s/export QT_AUTO_SCREEN_SCALE_FACTOR=.*/export QT_AUTO_SCREEN_SCALE_FACTOR=1.5/g" ~/.profile

xrandr --output DP-3 --off --output DP-1 --off --output eDP-1 --mode 3840x2160 --pos 1920x0 --rotate normal

xrdb ~/.Xdefaults
xrdb ~/.Xresources

xrandr --dpi 200

dconf write /org/gnome/desktop/interface/cursor-size 52

i3-msg restart

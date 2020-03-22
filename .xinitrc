#!/bin/bash 

export _JAVA_AWT_WM_NONREPARENTING=1

# Load Xresources file
xrdb -load ~/.Xresources &

case "$1" in
    bspwm) exec bspwm ;;
    gnome-xorg) exec gnome-session ;;
    "GNOME on Xorg") exec gnome-session ;;

esac

#bspwm

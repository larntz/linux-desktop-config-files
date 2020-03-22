#!/bin/bash


destination=/home/larntz/Documents/dotfiles/

dotfiles=(.xinitrc .Xresources .zshenv .zshrc .urxvt .icons)
dotfiles+=(.config/bspwm .config/sxhkd .config/gtk-2.0 .config/gtk-3.0)
dotfiles+=(.config/dunst .config/nvim)
dotfiles+=(.bin/audio_out .bin/dunstify_time.sh .bin/dunstify_volume.sh)

for file in ${dotfiles[*]}
do
    cp -rf $HOME/$file $destination
done

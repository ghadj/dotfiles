#! /bin/zsh
# remap right ctrl key to space key
xmodmap -e 'keysym Control_R = KP_Space'
# remap Ü to backspace
xmodmap -e 'keysym 0xfc = BackSpace'
# remap Ä to enter
xmodmap -e 'keysym 0xe4 = Return'
# remap Ö to F10
xmodmap -e 'keysym 0xf6 = F10'

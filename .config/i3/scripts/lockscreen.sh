#!/bin/bash
# source https://www.reddit.com/r/i3wm/comments/8hpjb6/i3_lock_screen/

revert() {
  rm /tmp/*screen*.png
  xset dpms 0 0 0
}
trap revert HUP INT TERM
xset +dpms dpms 0 0 5
scrot -d 1 /tmp/locking_screen.png
convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
#convert -composite /tmp/screen_blur.png /home/george/.config/i3/Pictures/Evil_Rick_Sprite.png -gravity South -geometry -20x3200 /tmp/screen.png
convert /tmp/screen_blur.png -gravity South -geometry -20x3200 /tmp/screen.png
#-u --no-unlock-indicator
i3lock -u -i /tmp/screen.png
revert

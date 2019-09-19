#!/bin/bash
# https://docs.slackware.com/howtos:window_managers:keyboard_layout_in_i3
# TODO not working

i3status --config ~/.i3status.conf | while :
do
    read line
    LG=`bash ~/.config/i3/scripts/i3-keyboard-layout.sh`
    dat="[{ \"full_text\": \"LANG: $LG\", \"color\":\"#009E00\" },"

    echo "${line/[/$dat}" || exit 1
done

#!/usr/bin/env python
# -*- coding: utf-8 -*-

# This script is a simple wrapper which prefixes each i3status line with custom
# information.
#
# To use it, ensure your ~/.i3status.conf contains this line:
#     output_format = "i3bar"
# in the 'general' section.
# Then, in your ~/.i3/config, use:
#     status_command i3status | ~/i3status/contrib/wrapper.py
# In the 'bar' section.
#
# George Hadjiantonis

import json
import subprocess
import sys


def get_rhythmbox_status():
    """ Get the current song playing and elapsed time from rhythmbox if it is running. """
    cmd = "rhythmbox-client --no-start --print-playing-format '%aa - %tt '"
    try:
        rb_output = subprocess.check_output(cmd, shell=True)
        rb_output = rb_output.strip()
    except subprocess.CalledProcessError as cpe:
        rb_output = "Rhythmbox Client: Error"

    if "(Unknown)" in str(rb_output):
        rb_output = "Rhythmbox: Not Playing"

    return str(rb_output)

def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + '\n')
    sys.stdout.flush()

def read_line():
    """ Interrupted respecting reader for stdin. """
    # try reading a line, removing any extra whitespace
    try:
        line = sys.stdin.readline().strip()
        # i3status sends EOF, or an empty line
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()

def get_keyboard_layout():
    """ Call bash script to get current keyboard layout  """
    cmd = "echo `~/.config/i3/Keyboard_Layout_Tool/bin/xkblayout-state print \"%s\"`"
    try:
        kb = subprocess.run(cmd, stdout=subprocess.PIPE, shell=True)
        kb = kb.stdout.decode('utf-8')[:2].upper()
    except subprocess.CalledProcessError as cpe:
        kb = "Unavailable"

    return str(kb)

if __name__ == '__main__':
    # Skip the first line which contains the version header.
    print_line(read_line())

    # The second line contains the start of the infinite array.
    print_line(read_line())

    while True:
        line, prefix = read_line(), ''
        # ignore comma at start of lines
        if line.startswith(','):
            line, prefix = line[1:], ','

        j = json.loads(line)
        # insert information into the start of the json, but could be anywhere
        # CHANGE THIS LINE TO INSERT SOMETHING ELSE
        #j.insert(0, {'full_text' : get_rhythmbox_status() + " ", 'name' : 'rhythmbox'})
        j.insert(0, {'full_text' : get_keyboard_layout() + " ", 'name' : 'keyboard'})
        # and echo back new encoded json
        print_line(prefix+json.dumps(j))
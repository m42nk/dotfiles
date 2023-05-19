#!/bin/env bash

wmctrl -l -x -p | awk -v currentDesktop=$(xdotool get_desktop) '$2 == currentDesktop' | awk '{print $4}' | cut -d'.' -f1

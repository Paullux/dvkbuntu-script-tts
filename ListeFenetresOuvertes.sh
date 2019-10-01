#!/bin/bash

wmctrl -root -children -l | grep -o "$HOSTNAME.*" | sed "s/$HOSTNAME //g" | awk -F "— " '{ print $NF }' | awk -F "- " '{ print $NF }' | sed '/Plasma/d' | sed '/^/G'  | espeak -v mb/mb-fr4 -s 130 

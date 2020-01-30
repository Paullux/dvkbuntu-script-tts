#!/bin/bash

a=$(wmctrl -root -children -l | grep -o "$HOSTNAME.*" | sed "s/$HOSTNAME //g" | awk -F "— " '{ print $NF }' | awk -F "- " '{ print $NF }' | sed '/Plasma/d' | sed '/^/G')
google_speech -l fr-fr "$a" 

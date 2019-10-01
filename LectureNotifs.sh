#!/bin/bash

dbus-monitor "interface='org.freedesktop.Notifications'" | grep --line-buffered "string" | grep --line-buffered -e method -e ":" -e '""' -e urgency -e notify -v | grep --line-buffered '.*(?=string)|(?<=string).*' -oPi | grep --line-buffered -v '^\s*$' | grep --line-buffered -v "image-data\|default\|View\|desktop-entry\|variant" | xargs -I '{}' google_speech -l fr-fr {}

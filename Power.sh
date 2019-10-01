#!/bin/bash

if [ "$1" == "shutdown" ]
then
espeak -v mb/mb-fr4 -s 130 "Le PC s'éteint"
qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 2 3
fi

if [ "$1" == "reboot" ]
then
espeak -v mb/mb-fr4 -s 130 "Le PC reboot"
qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 1 3
fi


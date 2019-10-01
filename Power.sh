#!/bin/bash

if [ "$1" == "shutdown" ]
then
google_speech -l fr-fr "Le PC s'éteint"
qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 2 3
fi

if [ "$1" == "reboot" ]
then
google_speech -l fr-fr "Le PC reboot"
qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 1 3
fi


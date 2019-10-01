#!/bin/bash
google_speech -l fr-fr "arrêt de la fenêtre en cours"
xdotool getwindowfocus windowkill

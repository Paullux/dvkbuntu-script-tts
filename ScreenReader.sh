#!/bin/bash

#Développeurs : Paullux, U_Bren

# create work folder
workDir="/tmp/OCR"
[ ! -d "$workDir" ] && mkdir "$workDir"

#Rectangle notation :
# (0,1); (1,1)
# (0,0); (1,0)

#Offset the screenshot rectangle to the upper-left corner (0,1) by this amount in the X/Y direction
#Might be a problem for i18n & RTL languages but... Oh, well

NegX01Offset=300
NegY01Offset=75

#Size of the rectangle
posX10=600
posY10=150

#Set X,Y to the Cursor position.
eval $(xdotool getmouselocation --shell)
posX01=$(($X-$NegX01Offset))

posY01=$(($Y-$NegY01Offset))

#Make screenshot
case $1 in
    souris)
scrot -a "$posX01","$posY01","$posX10","$posY10" -o "$workDir"/OCR.png;;
    fenCourante)
a="La fenêtre courante est"
b=$(cat /proc/"$(xdotool getwindowpid $(xdotool getactivewindow))"/comm)
c="La fenêtre courante contient"
d="${a} ${b} ${c}"
google_speech -l fr-fr "$d"
scrot -u -o "$workDir"/OCR.png;;
    selection)
google_speech -l fr-fr  "sélectionnez la zone à lire"
import "$workDir"/OCR.png;;
    *) a="Vous devez préciser une option"
google_speech -l fr-fr  "$a" 
exit 0;;
esac

#OCR
tesseract "$workDir"/OCR.png "$workDir"/text -l fra
#TTS
google_speech -l fr-fr "$(cat "$workDir"/text.txt)"

#delete work folder
rm -rf "$workDir"

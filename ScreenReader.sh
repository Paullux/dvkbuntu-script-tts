#!/bin/bash

#Développeurs : Paullux, U_Bren

# create work folder
workDir="/tmp/OCR"
[ ! -d "$workDir" ] && mkdir "$workDir"

# Initialisation des variables
unset MOUSE
unset CURRENT_WINDOW
unset SELECTION
MOUSE=false
CURRENT_WINDOW=false
SELECTION=false

#Options choice
case $1 in
    -m)
        MOUSE=true;;

    -w)
        CURRENT_WINDOW=true;;

    -s)
        SELECTION=true;;

    *) 
        #Quit if non choice
        a="Vous devez préciser une option valable"
        google_speech -l fr-fr  "$a" 
        exit 0;;
esac

#Make screenshots
if $MOUSE; then
    # for distinguishing " ", "\t" from "\n"
    IFS=''
    #Attente retour utilisateur
    google_speech -l fr-fr  "Appuyer sur espace pour déplacer la sélection..."
    google_speech -l fr-fr  "Et appuyer sur la touche entrée pour valider la sélection..."
    #initialisation de la variable
    pressed="a"
    #lancement de la détection de la validation
    while [ "$pressed" != "" ]; do
        #détection de l'appui des touches
        read -n1 -r -p "Appuyer sur espace pour déplacer la sélection et appuyer sur la touche entrée pour valider la sélection..." pressed
        #To quit when validate
        if [ "$pressed" == "" ]; then
            break
        fi        
        #Offset the screenshot rectangle to the upper-left corner (0,1) by this amount in the X/Y direction
        #Might be a problem for i18n & RTL languages but... Oh, well
        NegX01Offset=128
        NegY01Offset=50
        #Size of the rectangle
        posX10=256
        posY10=100
        #Set X,Y to the Cursor position.
        eval $(xdotool getmouselocation --shell)
        posX01=$(($X-$NegX01Offset))
        posY01=$(($Y-$NegY01Offset))
        #To take screenShot
        scrot -a "$posX01","$posY01","$posX10","$posY10" -o "$workDir"/OCR.png
        #Drawing Rectangle (remove old)
        kill $(pgrep -f "lemonbar -n my_lemonbar")
        kill $(pgrep -f "lemonbar -n my_lemonbar")
        #Drawing Rectangle (real draw)
        lemonbar -n my_lemonbar -d -g "$posX10"x"$posY10"+"$posX01"+"$posY01" -B '#88ff0000' &
    done
fi

if $CURRENT_WINDOW; then
    # To prepare the commande
    a="La fenêtre courante est"
    b=$(cat /proc/"$(xdotool getwindowpid $(xdotool getactivewindow))"/comm)
    c="La fenêtre courante contient"
    d="${a} ${b} ${c}"
    google_speech -l fr-fr "$d"
    #ScreenShot
    scrot -u -o "$workDir"/OCR.png
fi 

if $SELECTION; then
    #To prepare the commande
    google_speech -l fr-fr  "sélectionnez la zone à lire"
    #ScreenShot
    import "$workDir"/OCR.png
fi


#Déchiffrement de la capture par OCR
tesseract "$workDir"/OCR.png "$workDir"/text -l fra
#Lecture du texte déchiffrer par OCR grâce au TTS
google_speech -l fr-fr "$(cat "$workDir"/text.txt)"

#kill rectangle
sleep 3
if $MOUSE; then
kill $(pgrep -f "lemonbar -n my_lemonbar")
kill $(pgrep -f "lemonbar -n my_lemonbar")
fi

#delete work folder
rm -rf "$workDir"

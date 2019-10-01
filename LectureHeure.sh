# Auteur : benoitfra
# Contact : 
# Version : 1.0
# Licence : GPL v3
# Fonction : Diction de l'heure 
# Shell : bash
# Paramètres : aucun
# Dépendance : espeak, mbrola, notify-send

#!/bin/bash

##### configuration du format de sortie de la date ("man date" pour plus d'option)  ########
HEURE=`date '+%H'`
MINUTE=`date '+%M'`

##### chiox du type de voix à utiliser #####
VOIX=/opt/mbrola/fr4/fr4 
TYPE=mb/mb-fr4 
#VOIX=/opt/mbrola/fr1/fr1 (décommenter pour une voix d'homme)
#TYPE=mb/mb-fr1 


##### test pour savoir si la lecture est en route #####
if [ ! -z $(ps -A | grep mbrola | awk '{ print $1 }' ) ]; then
     kill $(ps -A | grep mbrola | awk '{ print $1 }' ) && sleep 2
fi

##### Notification de l'heure #####
google_speech -l fr-fr "ilè/$HEURE/heure/et/$MINUTE/minute" 
notify-send -i "/usr/share/icons/HighContrast/scalable/actions-extra/history-view.svg" "`date`"

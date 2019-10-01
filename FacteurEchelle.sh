#!/bin/bash

[[ -z "$1" ]] && espeak -v mb/mb-fr4 -s 130 "A quelle échelle l'interface doit être définie?"
if [[ "$1" < 1 || "$1" > 3 ]]
then
espeak -v mb/mb-fr4 -s 130 "Vous devez fournir une échelle comprise entre 1 et 3"
elif [[ ! -z "$1" ]]
then
/opt/dvkbuntu-menu-acceuil/ScaleFactor.sh "$1"
espeak -v mb/mb-fr4 -s 130 "Opération réusite, redémarrage nécessaire"
fi

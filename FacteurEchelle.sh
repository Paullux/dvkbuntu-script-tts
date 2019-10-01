#!/bin/bash

[[ -z "$1" ]] && google_speech -l fr "A quelle échelle l'interface doit être définie?"
if [[ "$1" < 1 || "$1" > 3 ]]
then
google_speech -l fr "Vous devez fournir une échelle comprise entre 1 et 3"
elif [[ ! -z "$1" ]]
then
/opt/dvkbuntu-menu-acceuil/ScaleFactor.sh "$1"
google_speech -l fr "Opération réussie, redémarrage nécessaire"
fi

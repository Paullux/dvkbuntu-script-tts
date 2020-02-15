# Bienvenu sur Scripts TTS !

Le but est de fournir des commandes bash pour exécuter certaines tâches, le but final étant de le coupler à un système d'assistant virtuel afin de contrôler le système à la voix.  
Pour un meilleur confort d'utilisation, j'ai utilisé google_speech dans les scripts. Si vous voulez rester avec une solution 100% libre et local (uniquement sur votre pc) je vous invite après installation (voir plus  bas) à executer la commande suivante :  
``sudo update-alternatives --config  tts``  
   
## ScreenReader

__Rôle :__  lecture d'écran :   

```ScreenReader -m```
Lit le texte placé sous le **curseur de souris.** 
   
```ScreenReader -w ```
Lit l'intégralité de la **page active** au moment du lancement de la commande.
  
```ScreenReader -s```
Ouvre un **rectangle de sélection** pour y **lire le contenu.**   
  
## Power
   
   __Rôle :__  Contrôle de l'alimentation du pc :
     
```Power shutdown```
**Éteint le pc.**   
    
```Power reboot```
**Redémarre le PC**

## ChangerFenetre
  
  __Rôle :__  Basculer d'une fenêtre à l'autre :  
    
  ```ChangerFenetre```
 **Bascule vers** vers une **autre** application.  
   
   **Exemples :**   
```ChangerFenetre```  
  
## ListeFenetresOuvertes
  
  __Rôle :__ Liste en vocale les fenêtres ouvertes.    
    
  ```ListeFenetresOuvertes```

## LectureNotifs
  
   __Rôle :__ Lance la lecture automatique en vocale de toute les notifications:  
  
   ```LectureNotifs```
     
   **Attention nécessite de redémarrer le pc pour être arrêté.**

## LectureHeure
  
   __Rôle :__ Donne l'heure.  
  
   ```LectureHeure```
     
## KillFenetre

   __Rôle :__ Tue la fenêtre de premier plan.  
  
   ```KillFenetre```

## FenetreCourante
  
   __Rôle :__ Vocalise le nom de la fenêtre de premier plan.  
  
```FenetreCourante```
   
## FacteurEchelle
  
 __Rôle :__ Change le facteur d'échelle sur DVKBuntu, Pour permettre à un mal voyant de mieux voir l'écran :  
  
```FacteurEchelle x.y```

**Où x.y est un nombre à 1 chiffre après la virgule (ici un point car mode anglais).** Par exemple 1.0 ou 2.8.
  
## Pour utiliser avec ***nocomprendo*** un assistant vocal sous linux.  
  
arrêtez complétement __*nocomprendo*__ avant installation   
   
## Dépendance & installation :  
***espeak, wmctrl, dvkbuntu, xdotool, tesseract-ocr-fra sous Ubuntu ( ou tesseract-data-fra sous Arch), scrot, imagemagick, notify-send, sox, lame, libsox-fmt-mp3, xbacklight, nocomprendo, git, google_speech, mbrola voice.***  
pour ubuntu :   

```   
# travail de l'équipe dvkbuntu  
rm -rf dvkbuntu-script-tts # si précédemment cloner à ne pas oublier   
# Autres commande dans tout les cas   
git clone https://github.com/handyopensource/dvkbuntu-script-tts.git       
cd dvkbuntu-script-tts       
sudo ./install.sh       
  
# Pour choisir son service de vocalisation, soit celui de Google (logiciel libre) qui passe par le réseaux ou espeak qui est local, libre et open source.     
sudo update-alternatives --config tts     

```  

Dans nocomprendo, parcourer la liste des commandes pour voir ce que vous pouvez faire à la voix.  

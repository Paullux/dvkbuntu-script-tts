# Bienvenu sur Scripts TTS !

Le but est de fournir des commandes bash pour exécuter certaines tâches, le but final étant de le coupler à un système d'assistant virtuel afin de contrôler le système à la voix.  
Pour un meilleur confort d'utilisation, j'ai utilisé google_speech dans les scripts. Si vous voulez rester avec une solution 100% libre et local (uniquement sur votre pc) je vous invite à remplacer :  
``google_speech -l fr-fr``  
par  
``espeak -v mb/mb-fr4 -s 130``  
A terme, je vais créer une interface pour choisir la version **libre et local** ou **Google** (qui utilise le réseau mais qui est sous licence LGPLv2.1) de la __*synthèse vocale*__.  

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

## Dépendance :
***espeak, wmctrl, dvkbuntu, xdotool, tesseract-ocr-fra sous Ubuntu ( ou tesseract-data-fra sous Arch), scrot, imagemagick, notify-send, sox, lame, libsox-fmt-mp3, xbacklight, nocomprendo.***  
pour ubuntu :   

```

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/be-root:/nocomprendo/xUbuntu_19.10/ /' > /etc/apt/sources.list.d/home:be-root:nocomprendo.list"    
wget -nv https://download.opensuse.org/repositories/home:be-root:nocomprendo/xUbuntu_19.10/Release.key -O Release.key    
sudo apt-key add - < Release.key    
sudo apt update    
sudo apt upgrade    
sudo apt install nocomprendo espeak wmctrl dvkbuntu xdotool tesseract-ocr-fra scrot imagemagick libnotify-bin sox lame libsox-fmt-mp3 xbacklight    
git clone https://github.com/handyopensource/dvkbuntu-script-tts.git    
cd dvkbuntu-script-tts  
./install.sh    

``` 
  
  ***google_speech***
```
sudo pip3 install google_speech
```  


## Pour utiliser avec ***nocomprendo*** un assistant vocal sous linux.

ouvrez __*nocomprendo*__ et dans le menu Sélecteur de groupes de commandes importer le fichier dvkbuntu.noc  
Parcourer la liste des commandes pour voir ce que vous pouvez faire à la voix.

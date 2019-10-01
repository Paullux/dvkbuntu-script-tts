# Bienvenu sur Scripts TTS !

Le but est de fournir des commandes bash pour exécuter certaines tâches, le but final étant de le coupler à un système d'assistant virtuel afin de contrôler le système à la voix.

## ScreenReader.sh

__Rôle :__  lecture d'écran :   

```./ScreenReader.sh souris```
Lit le texte placé sous le **curseur de souris.** 
   
```./ScreenReader.sh fenCourante ```
Lit l'intégralité de la **page active** au moment du lancement de la commande.
  
```./ScreenReader.sh selection```
Ouvre un **rectangle de sélection** pour y **lire le contenu.**   
  
## Power.sh
   
   __Rôle :__  Contrôle de l'alimentation du pc :
     
```./Power.sh shutdown```
**Éteint le pc.**   
    
```./Power.sh reboot```
**Redémarre le PC**

## ChangerFenetre.sh
  
  __Rôle :__  Basculer d'une fenêtre à l'autre :
    
  ```./ChangerFenetre.sh ${AppName}```
 **Bascule vers** l'application **AppName.**  
   
   **Exemples :** 
```./ChangerFenetre.sh Konsole```
```./ChangerFenetre.sh Dolphin```
```./ChangerFenetre.sh Chromium```
  
## ListeFenetresOuvertes.sh
  
  __Rôle :__ Liste en vocale les fenêtres ouvertes.  
  ```./ListeFenetresOuvertes.sh```

## LectureNotifs.sh
  
   __Rôle :__ Lance la lecture automatique en vocale de toute les notifications:
   ```./LectureNotifs.sh```
     
   **Attention nécessite de redémarrer le pc pour être arrêté.**

## LectureHeure.sh
  
   __Rôle :__ Donne l'heure.  
   ```./LectureHeure.sh```
     
## KillFenetre.sh

   __Rôle :__ Tue la fenêtre de premier plan.  
   ```./KillFenetre.sh```

## FenetreCourante.sh
  
   __Rôle :__ Vocalise le nom de la fenêtre de premier plan.  
```./FenetreCourante.sh```
   
## FacteurEchelle.sh
  
 __Rôle :__ Change le facteur d'échelle sur DVKBuntu, Pour permettre à un mal voyant de mieux voir l'écran :  
```./FacteurEchelle.sh x.y```

**Où x.y est un nombre à 1 chiffre après la virgule (ici un point car mode anglais).** Par exemple 1.0 ou 2.8.

## Dépendance :
***espeak, wmctrl, dvkbuntu, xdotool, kde-plasma, tesseract, scrot, imagemagick, notify-send.***
  
  ***google_speech***
```pip install google_speech```

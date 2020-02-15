#!/bin/bash

# Ajout du dépôt de nocomprendo un assistant vocal  
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/be-root:/nocomprendo/xUbuntu_19.10/ /' > /etc/apt/sources.list.d/home:be-root:nocomprendo.list"    
wget -nv https://download.opensuse.org/repositories/home:be-root:nocomprendo/xUbuntu_19.10/Release.key -O Release.key    
apt-key add - < Release.key
rm Release.key

# Mise à jour du système 
apt update    
apt upgrade   

# Installation des dépendances :    
apt install nocomprendo espeak wmctrl dvkbuntu xdotool tesseract-ocr-fra scrot imagemagick libnotify-bin sox lame libsox-fmt-mp3 xbacklight lemonbar git python3-pip mbrola-fr1
pip3 install google_speech

# Ajout des Wrappers (alternative en français de tts).
cat << FIN > "/usr/local/bin/google_speech_fr"
#!/bin/bash
google_speech -l fr-fr "\$1"
FIN
chmod +x /usr/local/bin/google_speech_fr

cat << FIN > "/usr/bin/espeak_fr"
#!/bin/bash
espeak -v mb/mb-fr1 -s 110 "\$1"
FIN
chmod +x /usr/bin/espeak_fr

# Ajout des Alternatives (choix possible) de toutes les voix différentes de tts
update-alternatives --install /etc/alternatives/tts.gz tts "/usr/local/bin/google_speech_fr" 10
update-alternatives --install /etc/alternatives/tts.gz tts "/usr/bin/espeak_fr" 5
update-alternatives --install /etc/alternatives/tts.gz tts "/usr/local/bin/google_speech" 2
update-alternatives --install /etc/alternatives/tts.gz tts "/usr/bin/espeak" 1

# Installation des scripts dans le système
cp ScreenReader /usr/bin/ScreenReader
cp Power /usr/bin/Power
cp ListeFenetresOuvertes /usr/bin/ListeFenetresOuvertes
cp LectureNotifs /usr/bin/LectureNotifs
cp LectureHeure /usr/bin/LectureHeure
cp KillFenetre /usr/bin/KillFenetre
cp FenetreCourante /usr/bin/FenetreCourante
cp FacteurEchelle /usr/bin/FacteurEchelle
cp ChangerFenetre /usr/bin/ChangerFenetre
cp KillLastScript /usr/bin/KillLastScript

# Paramétrages de NoComprendo
repertoire="/home/"$SUDO_USER"/.config/nocomprendo/"
[[ -d "$repertoire" ]] && rm -rf "$repertoire"
repertoire="/home/"$SUDO_USER"/.config/BeRoot/"
[[ -d "$repertoire" ]] && rm -rf "$repertoire"
tar xvzf fr_FR.tar.gz -C /usr/share/nocomprendo/defsets/

mkdir -p "/home/$SUDO_USER/.config/BeRoot/"

cat << FIN > "/home/$SUDO_USER/.config/BeRoot/NoComprendo.conf"
[General]
age=45
autoStart=true
confPos=@Point(99 69)
confSize=@Size(511 519)
defLang=fr_FR
gender=2
glideRate=20
glideStep=2
mainPos=@Point(0 29)
mainSize=@Size(1920 932)
mouseStep=20
osdAll=true
osdDuration=3000
osdOn=true
osdPosition=@Point(100 250)
osdSize=@Size(450 40)
rFontSize=18
rInvertColor=true
removeBadUtterance=false
speak=true
splitter=@ByteArray(\0\0\0\xff\0\0\0\x1\0\0\0\x2\0\0\x1\0\0\0\x1\x1a\x1\xff\xff\xff\xff\x1\0\0\0\x1\0)
useSysTray=true

[fr]
base=base.cmd
dvkbuntu=dvkbuntu.cmd
kde=kde.cmd
konsole=konsole.cmd
metas=metas.cmd
navigateur=navigateur.cmd
souris=souris.cmd
FIN

chown -R $SUDO_USER "/home/$SUDO_USER/.config/BeRoot/"

mkdir -p "/etc/skel/.config/BeRoot/"

cat << FIN > "/etc/skel/.config/BeRoot/NoComprendo.conf"
[General]
age=45
autoStart=true
confPos=@Point(99 69)
confSize=@Size(511 519)
defLang=fr_FR
gender=2
glideRate=20
glideStep=2
mainPos=@Point(0 29)
mainSize=@Size(1920 932)
mouseStep=20
osdAll=true
osdDuration=3000
osdOn=true
osdPosition=@Point(100 250)
osdSize=@Size(450 40)
rFontSize=20
rInvertColor=true
removeBadUtterance=false
speak=true
splitter=@ByteArray(\0\0\0\xff\0\0\0\x1\0\0\0\x2\0\0\x1\0\0\0\x1\x1a\x1\xff\xff\xff\xff\x1\0\0\0\x1\0)
useSysTray=true

[fr]
base=base.cmd
dvkbuntu=dvkbuntu.cmd
kde=kde.cmd
konsole=konsole.cmd
metas=metas.cmd
navigateur=navigateur.cmd
souris=souris.cmd
FIN

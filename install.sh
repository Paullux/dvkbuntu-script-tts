#!/bin/bash

cat << FIN > "/usr/local/bin/google_speech_fr"
#!/bin/bash
google_speech -l fr-fr "\$1"
FIN
chmod +x /usr/local/bin/google_speech_fr

cat << FIN > "/usr/bin/espeak_fr"
#!/bin/bash
espeak -v mb/mb-fr4 -s 200 "\$1"
FIN
chmod +x /usr/bin/espeak_fr

update-alternatives --install /etc/alternatives/tts.gz tts "/usr/local/bin/google_speech_fr" 10
update-alternatives --install /etc/alternatives/tts.gz tts "/usr/bin/espeak_fr" 5
update-alternatives --install /etc/alternatives/tts.gz tts "/usr/local/bin/google_speech" 2
update-alternatives --install /etc/alternatives/tts.gz tts "/usr/bin/espeak" 1

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

repertoire="/home/"$SUDO_USER"/.config/nocomprendo/"
[[ -d "$repertoire" ]] && rm -rf "$repertoire"
tar xvzf fr_FR.tar.gz -C /usr/share/nocomprendo/

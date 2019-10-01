 #!/bin/bash
espeak -v mb/mb-fr4 -s 130 "$(cat /proc/"$(xdotool getwindowpid "$(xdotool getactivewindow)")"/comm)"

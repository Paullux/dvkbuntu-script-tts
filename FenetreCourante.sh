 #!/bin/bash
google_speech -l fr-fr "$(cat /proc/"$(xdotool getwindowpid "$(xdotool getactivewindow)")"/comm)"

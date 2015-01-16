TARGET_FOLDER="$(osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)')"
open -a Terminal "$TARGET_FOLDER"


TARGET_FOLDER="$(osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)')"
if [[ -d "$TARGET_FOLDER" ]];then
     open -a Terminal "$TARGET_FOLDER"
     exit 0
else
     osascript -e 'display alert "Sorry, I got messed up!"'
exit 1
fi
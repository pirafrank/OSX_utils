read a1 <<< "{query}"
#osascript -e 'display alert "'"$a1"'"'

# a1 = source
SOURCE="$a1"

# gets filename from source absolute path
FILENAME="${SOURCE##*/}"
# gets target folder from Finder frontmost window
TARGET_FOLDER="$(osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)')"

TARGET="$TARGET_FOLDER/$FILENAME"

#ln -s "$SOURCE" "$TARGET"

osascript -e 'display alert "'"source $SOURCE"'"'
osascript -e 'display alert "'"target $TARGET"'"'

############ new script version

read a1 <<< "{query}"
#osascript -e 'display alert "'"$a1"'"'

if [[ -d "$a1" ]];then
     TARGET_FOLDER="$(osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)')"
     osascript -e 'display alert"'"$TARGET_FOLDER"'"'
     osascript -e 'display alert"'"$TARGET_FOLDER$(basename "$a1")"'"'
     #ln -s "$a1" "$TARGET_FOLDER$(basename "$a1")"
elif [[ -f "$a1" ]];then
     SOURCE="$a1"
     FILENAME="${SOURCE##*/}"
     TARGET_FOLDER="$(osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)')"
     TARGET="$TARGET_FOLDER$FILENAME"
     ln -s "$SOURCE" "$TARGET"
else
     osascript -e 'display alert "Sorry, I got messed up!"'
exit 1
fi







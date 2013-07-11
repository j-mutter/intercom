LAST=0

while [ 1 ]; do
  MESSAGE=`curl $URL`

  if [ "$MESSAGE" != "$LAST" ]; then
    echo $MESSAGE >> /tmp/intercom.log
    say $MESSAGE
    terminal-notifier  -title "Intercom" -message "$MESSAGE"
    if [ "$1" == "save" ]; then
      say $MESSAGE -o /tmp/intercom.m4a
      osascript -e "tell application \"iTunes\"" -e "set newFile to POSIX file \"/tmp/intercom.m4a\"" -e "add newFile to playlist \"shopify intercoms\"" -e "set newTrack to (add newFile)" -e "set name of newTrack to \"$MESSAGE\"" -e "end tell"
    fi
    LAST=$MESSAGE
  fi
  sleep 10
done

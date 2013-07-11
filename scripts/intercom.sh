LAST=0

while [ 1 ]; do
  MESSAGE=`curl -s $URL`

  if [ "$MESSAGE" != "$LAST" ]; then
    echo $MESSAGE >> /tmp/intercom.log
    say $MESSAGE
    if [ "$NOTIFICATIONS" = "1" ]; then
      terminal-notifier  -title "Intercom" -message "$MESSAGE" >/dev/null 2>&1
    fi
    if [ "$PLAYLIST" = "1" ]; then
      say $MESSAGE -o /tmp/intercom.m4a
      osascript -e "tell application \"iTunes\"" -e "set newFile to POSIX file \"/tmp/intercom.m4a\"" -e "add newFile to playlist \"shopify intercoms\"" -e "set newTrack to (add newFile)" -e "set name of newTrack to \"$MESSAGE\"" -e "end tell"
    fi
    LAST=$MESSAGE
  fi
  sleep 10
done

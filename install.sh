
function ask {
  echo $1        # add this line
  read -r
  if [[ $REPLY =~ ^[Yy] ]]; then
    return 1
  else
     return 0
  fi
}

PREFIX="/usr/local/bin"
INTERCOM_BIN="$PREFIX/intercom"

NOTIFICATIONS=0

ask "Do you want to install intercom notification messages? [yn]"
if [ "$?" = "1" ]; then
  gem install terminal-notifier
  NOTIFICATIONS=1
fi

ask "Do you want to install intercom as a service on boot? [yn]"
SERVICE=$?

ask "Do you want to save all intercoms as an itunes playlist? [yn]"
PLAYLIST=$?

TMP=`mktemp /tmp/intercom.XXXXX`

echo "#!/usr/bin/env bash" > $TMP
echo "PLAYLIST=$PLAYLIST" >> $TMP
echo "NOTIFICATIONS=$NOTIFICATIONS" >> $TMP
curl $URL/intercom >> $TMP

echo "Installing intercom to $INTERCOM_BIN"
mv $TMP $INTERCOM_BIN
chmod +x $INTERCOM_BIN

if [ "$SERVICE" = "1" ]; then
  echo
  echo "==========================================="
  echo "I am going to ask for SUDO to install intercom as a service. Dont panic!"
  echo
  sudo launchctl remove com.boourns.intercom
  sudo cp ./com.boourns.intercom.plist /Library/LaunchDaemons/com.boourns.intercom.plist

  sudo launchctl load -w /Library/LaunchDaemons/com.boourns.intercom.plist
fi

echo "done!"


function ask {
  echo $1        # add this line
  read -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
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

echo "Installing intercom to $INTERCOM_BIN"
curl -o $INTERCOM_BIN $URL/intercom
chmod +x $INTERCOM_BIN

if [ "$SERVICE" = "1" ]; then
  echo "I am going to ask for SUDO to install intercom as a service. Dont panic!"
  sudo launchctl remove com.boourns.intercom
  sudo cp ./com.boourns.intercom.plist /Library/LaunchDaemons/com.boourns.intercom.plist

  sudo launchctl load -w /Library/LaunchDaemons/com.boourns.intercom.plist
fi

echo "done!"

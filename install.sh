
PREFIX="/usr/local/bin"
INTERCOM_BIN="$PREFIX/intercom"
curl -o $INTERCOM_BIN $INTERCOM_URL/intercom

chmod +x $INTERCOM_BIN

gem install terminal-notifier

echo "I am going to ask for SUDO to install intercom as a service. Dont panic!"
sudo launchctl remove com.boourns.intercom
sudo cp ./com.boourns.intercom.plist /Library/LaunchDaemons/com.boourns.intercom.plist
sudo launchctl load -w /Library/LaunchDaemons/com.boourns.intercom.plist
echo "done!"


function ask {
  echo $1        # add this line
  read -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    return 1
  else
     return 0
  fi
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SELF="$DIR/`basename $0`"
trap 'rm $SELF' EXIT

PREFIX="/usr/local/bin"
INTERCOM_BIN="$PREFIX/intercom"
rm $INTERCOM_BIN

echo "I am going to ask for SUDO to uninstall the intercom service. Dont panic!"
sudo launchctl remove com.boourns.intercom
sudo rm /Library/LaunchDaemons/com.boourns.intercom.plist

ask "Do you also want to remove the notifications gem? [yn]"
if [ "$?" = "1" ]; then
  gem uninstall terminal-notifier
fi

echo "All done! To reinstall visit $URL"
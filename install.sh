#!/bin/bash

curl https://raw.github.com/boourns/intercom/master/intercom.sh > /usr/local/bin
chmod ugo+x /usr/local/bin/intercom.sh

curl https://raw.github.com/boourns/intercom/master/com.boourns.intercom.plist > /Library/LaunchDaemons/com.boourns.intercom.plist

chown root:wheel /Library/LaunchDaemons/com.boourns.intercom.plist

launchctl load -w /Library/LaunchDaemons/com.boourns.intercom.plist

echo "Now set INTERCOM_REDIS_CONFIG to the credentials config\n\n"

#!/usr/bin/env bash
LAST=0

while [ 1 ]; do
  MESSAGE=`redis-cli $INTERCOM_REDIS_CONFIG GET intercom-message`;
  if [ "$MESSAGE" != "$LAST" ]; then
    echo $MESSAGE >> /tmp/intercom.log
    say $MESSAGE
    if [ "$1" == "save" ]; then
      osascript -e "tell application \"iTunes\" to add POSIX file \"/tmp/intercom.m4a\""
    fi
    LAST=$MESSAGE
  fi
  sleep 10
done

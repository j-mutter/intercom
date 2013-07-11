#!/usr/bin/env bash

touch /tmp/intercom-last

while [ 1 ]; do
  redis-cli $INTERCOM_REDIS_CONFIG GET intercom-message > /tmp/intercom-new;
  DIFF=`diff -q /tmp/intercom-new /tmp/intercom-last 2>/dev/null`
  if [ "$DIFF" != "" ]; then
    cat /tmp/intercom-new | say
    if [ "$1" == "save" ]; then
      cat /tmp/intercom-new | /usr/bin/say -o /tmp/intercom.m4a
      osascript -e "tell application \"iTunes\" to add POSIX file \"/tmp/intercom.m4a\""
    fi
    mv /tmp/intercom-new /tmp/intercom-last
  fi
  sleep 10
done

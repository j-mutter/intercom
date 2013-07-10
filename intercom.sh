#!/bin/bash

while [ 1 ]; do
  /opt/boxen/homebrew/bin/redis-cli $INTERCOM_REDIS_CONFIG GET intercom-message > /tmp/intercom-new;
  NEW=`md5 -q /tmp/intercom-new 2>/dev/null`
  OLD=`md5 -q /tmp/intercom-last 2>/dev/null`
  if [ "$NEW" != "$OLD" ]; then
    cat /tmp/intercom-new | /usr/bin/say
    mv /tmp/intercom-new /tmp/intercom-last
  fi
  sleep 10
done

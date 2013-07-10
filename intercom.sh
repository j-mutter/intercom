#!/bin/bash
while [ 1 ]; do
  redis-cli $INTERCOM_REDIS_CONFIG GET intercom-message > /tmp/intercom-new;
  DIFF=`diff -q /tmp/intercom-new /tmp/intercom-last 2>/dev/null`
  if [ "$DIFF" != "" ]; then
    cat /tmp/intercom-new | say
    mv /tmp/intercom-new /tmp/intercom-last
  fi
  sleep 10
done

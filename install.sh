#!/bin/bash

PREFIX="/usr/local/bin"
INTERCOM_BIN="$PREFIX/intercom"
curl -o $INTERCOM_BIN https://raw.github.com/boourns/intercom/master/intercom.sh
chmod +x $INTERCOM_BIN

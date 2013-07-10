Installing
==========

Install redis-cli.

`bash <(curl -s https://raw.github.com/boourns/intercom/master/install.sh)`

set INTERCOM_REDIS_CONFIG in your ~/.bash_profile (ask around for credentials).

get a free redis instance via http://redistogo.com/ if you want to start your own intercom.

An example INTERCOM_REDIS_CONFIG would be `-h server.redistogo.com -p <port> -a <just the password, no username>`

Usage
=====

Get many nodes around the office / world to run `./intercom.sh &`

To broadcast a message, use:

`redis-cli $INTERCOM_REDIS_CONFIG set intercom-message "hello, world"`

Integrate intercom into your apps by writing messages to `intercom-message`

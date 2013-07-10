Installing
==========

bash <(curl -s https://raw.github.com/boourns/intercom/master/install.sh)

get a free redis instance via http://redistogo.com/.

set INTERCOM_REDIS_CONFIG in your ~/.bash_profile (ask around for credentials).

An example INTERCOM_REDIS_CONFIG would be `-h server.redistogo.com -p <port> -a <just the password, no username>`

Usage
=====

Get many nodes around the office / world to run `./intercom.sh &`

To broadcast a message, use:

`redis-cli $INTERCOM_REDIS_CONFIG set intercom-message "hello, world"`

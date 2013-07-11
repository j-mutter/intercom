Intercom (tm)(c)(r) - Join The Conversation(c)

Installing
==========

Create a heroku app and push this repo to the heroku app.
name this heroku app something like 'intercom.herokuapp.com'
set the URL for the installer: `heroku config:set INTERCOM_URL=http://intercom.herokuapp.com`

Install with: `bash <(curl -s http://intercom.herokuapp.com/install)`
It will ask if you want to install as a daemon, if you want to save all messages to itunes, and if you want notifications.

Send messages to intercom using `curl http://intercom.herokuapp.com?message=omg`

Usage
=====

Get many nodes around the office / world to run `intercom &`

To broadcast a message, use:

```
              __                 __   
___________ _/  |_  ____   _____/  |_ 
\____ \__  \\   __\/ __ \ /    \   __\
|  |_> > __ \|  | \  ___/|   |  \  |  
|   __(____  /__|  \___  >___|  /__|  
|__|       \/          \/     \/      
                          .___.__                
______   ____   ____    __| _/|__| ____    ____  
\____ \_/ __ \ /    \  / __ | |  |/    \  / ___\ 
|  |_> >  ___/|   |  \/ /_/ | |  |   |  \/ /_/  >
|   __/ \___  >___|  /\____ | |__|___|  /\___  / 
|__|        \/     \/      \/         \//_____/  
```

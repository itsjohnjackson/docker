#!/bin/bash

if [[ ! -f /etc/nginx/ssl/server.crt || ! -f /etc/nginx/ssl/server.crt ]]; then  
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj '/CN=test.server' 
fi

if [ -z $BASIC_AUTH_USERNAME ]; then
  echo >&2 "BASIC_AUTH_USERNAME must be set"
  exit 1
fi

if [ -z $BASIC_AUTH_PASSWORD ]; then
  echo >&2 "BASIC_AUTH_PASSWORD must be set"
  exit 1
fi

#Create user for auth 'b' allows to pass creds without prompt, 'm' uses md5 (B-Crypt gives 500 error after auth)
htpasswd -cbm /etc/nginx/.htpasswd $BASIC_AUTH_USERNAME $BASIC_AUTH_PASSWORD

#confirm user written

cat /etc/nginx/.htpasswd

cd /srv/data
screen -d -m python3 /home/python-uploader.py
exec nginx -g "daemon off;"
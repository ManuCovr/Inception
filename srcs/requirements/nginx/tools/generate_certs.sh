#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx-selfsigned.key \
  -out /etc/ssl/certs/nginx-selfsigned.crt \
  -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42/CN=mde-maga.42.fr"
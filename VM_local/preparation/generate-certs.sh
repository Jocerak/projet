#!/bin/bash
mkdir -p /opt/certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /opt/certs/privkey.pem \
  -out /opt/certs/fullchain.pem \
  -subj "/C=FR/ST=Paris/L=Paris/O=DevOps/CN=nginx.local"
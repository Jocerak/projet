#!/bin/bash

mkdir -p /opt/certs/{nextcloud.local,jenkins.local,grafana.local}

domains=(nextcloud.local jenkins.local grafana.local)

for domain in "${domains[@]}"; do
  openssl req -x509 -nodes -days 365 \
    -newkey ec -pkeyopt ec_paramgen_curve:secp384r1 \
    -keyout "/opt/certs/$domain/$domain.key" \
    -out "/opt/certs/$domain/$domain.crt" \
    -subj "/CN=$domain" \
    -addext "subjectAltName=DNS:$domain"
done

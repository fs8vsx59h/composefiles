#!/bin/bash
touch /etc/sing-box/fullchain.cer
touch /etc/sing-box/private.key
jq -r  '.gtscf.Certificates[0].certificate' /etc/traefik/acme.json | base64 -d > /etc/sing-box/fullchain.cer
jq -r  '.gtscf.Certificates[0].key' /etc/traefik/acme.json | base64 -d > /etc/sing-box/private.key
sing-box run -c /etc/sing-box/config.json

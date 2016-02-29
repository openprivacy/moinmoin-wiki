#!/bin/bash

domain=$1

if [[ -z "$domain" ]]; then
    echo "Usage: $0 domain"
    exit 1
fi
 
country=US
state=Pennsylvania
locality=Pittsburgh
organization=OpenPrivacy

openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 \
	-keyout ${domain}.key -out ${domain}.crt \
	-subj "/CN=$domain/C=$country/ST=$state/L=$locality/O=$organization"

openssl x509 -in ${domain}.crt -text -noout

ls -l ${domain}.{crt,key}

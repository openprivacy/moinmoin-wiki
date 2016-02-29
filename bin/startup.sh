#!/bin/bash

# Set up proxy
# docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
# service docker-nginx-proxy start

docker build -t moinmoin .

docker run -e VIRTUAL_HOST=wiki.labalme.com -dit \
       -v /media/www/moin-labalme/data:/usr/local/share/moin/data \
       -v /var/log/httpd/moin-labalme:/var/log/nginx \
       --name moin-labalme moinmoin

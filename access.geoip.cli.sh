#!/bin/bash

# CopyPaste this to command line
for i in $(tail -n 1  /var/log/nginx/access.log | awk '{print $1}'); do curl -s http://ipinfo.io/$i | jq -r '.city,.region,.country,.timezone'; done

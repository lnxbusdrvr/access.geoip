#!/bin/bash

# Get last ip-address from access.log
for i in $(tail -n 1  /var/log/nginx/access.log | awk '{print $1}');
# Tell ip-address for API
# and get result as JSON's city, region and country -infos
do curl -s http://ipinfo.io/$i | jq -r '.city,.region,.country';
done

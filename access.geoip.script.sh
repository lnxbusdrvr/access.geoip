#!/bin/bash

# Get one row (tail -n1) from Apache/Nginx's access.log
# print only first column (awk) from the file, which is ip-address.
# Tell ip-address from access.log to API's url 
# Get result with using JSON's keywords (jq): city, region and country -infos
# Tells visitor city, region and country-code

accesslog="/var/log/nginx/access.log"
apiurl="http://ipinfo.io/"

for i in $(tail -n 1 $accesslog | awk '{print $1}')
# Tell access.log's 1st column (ip) to API
do curl -s $apiurl$i | jq -r '.city, .region, .country, .timezone'
done

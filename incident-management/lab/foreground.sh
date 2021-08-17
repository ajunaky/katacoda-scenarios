#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres

statuscheck files

# cd /ecommworkshop
# rm -r ./store-frontend-instrumented-fixed
# rm -r ./store-frontend-broken-instrumented
# git fetch
# git checkout 11e4a4b ./store-frontend-instrumented-fixed
# git checkout 11e4a4b ./store-frontend-broken-instrumented

#cp /root/frontend-docker-entrypoint.sh ./store-frontend-instrumented-fixed/docker-entrypoint.sh
#cp /root/frontend-docker-entrypoint.sh ./store-frontend-broken-instrumented/docker-entrypoint.sh

cd /ecommworkshop/deploy/docker-compose
docker-compose -f docker-compose-broken.yml up -d


curl -X POST "https://api.datadoghq.com/api/v1/monitor" \
-H "Content-Type: application/json" \
-H "DD-API-KEY: ${DD_API_KEY}" \
-H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
-d @- << EOF
{
  "name" : "Monitor for Incident Management Course",
  "type" : "metric alert",
  "message" : "\`store-frontend\` average latency is too high.",
  "query" : "avg(last_1m):avg:trace.rack.request{env:ruby-shop,resource_name:spree::homecontroller_index,service:store-frontend} > 1",
  "options": {
    "notify_audit": false,
    "locked": false,
    "timeout_h": 0,
    "new_host_delay": 300,
    "require_full_window": false,
    "notify_no_data": false,
    "renotify_interval": "0",
    "escalation_message": "",
    "no_data_timeframe": null,
    "include_tags": true,
    "thresholds": {
      "critical": 1
    }
  },
  "tags" : ["service:store-frontend", "env:ruby-shop", "resource_name:spree::homecontroller_index"]
}
EOF


envready

statusupdate complete

prepenvironment
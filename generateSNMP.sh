#!/bin/bash

cd snmp_exporter
docker compose up -d
sleep 15
echo "loading" > snmp.yml
docker exec SNMPgen sh -c "cd /root/go/src/github.com/prometheus/snmp_exporter/generator/ && ./generator generate"
cat HeaderSNMPFile snmp.yml > temp_file && mv temp_file snmp.yml
sleep 5
docker compose down
cd ..

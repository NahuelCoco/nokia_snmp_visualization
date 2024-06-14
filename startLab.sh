#!/bin/bash
cd snmp_exporter
docker run -v "./:/opt" "prom/snmp-generator" generate --no-fail-on-parse-errors
cd ..
docker compose up -d

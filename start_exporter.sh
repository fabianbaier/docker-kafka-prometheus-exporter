#!/bin/bash
set -e

## Configuring jupyter with correct context

if [ -z "$KAFKA_HOSTPORT" ]; then
  echo "Missing Kafka Hostport Environment Variable, abort."
  exit
else
  sed -i "s/KAFKA_HOSTPORT/$KAFKA_HOSTPORT/g" /usr/app/prom-jmx-agent-config.yml
fi

## Starting JMX Prometheus Exporter
cd /usr/app/jmx_exporter && java -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=5555 -jar jmx_prometheus_httpserver/target/jmx_prometheus_httpserver-0.1.0-jar-with-dependencies.jar 5556 /usr/app/prom-jmx-agent-config.yml
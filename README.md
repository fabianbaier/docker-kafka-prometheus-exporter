## dcos-insights-kafka-prometheus-exporter

Tool that consumes a Kafka topic produced by the [dcos-plunger](https://github.com/mesosphere/dcos-insights-plunger) and exposes the data in the Prometheus supported [format](https://prometheus.io/docs/instrumenting/exposition_formats/) to scrape.

## Dependencies

* JMX enabled for your Kafka instance
* [JMX Prometheus Javaagent 1.0](http://central.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.1.0/jmx_prometheus_javaagent-0.1.0.jar) 

## Building

If there is a new version of the JMX Prometheus Exporter available just run this command in docker path and tag the current version, e.g. `0.1.0`:

```bash
$ make version=0.1.0
```

## Environment Variables

| Variable   | Description |
|:----------:|-------------|
| **`KAFKA_HOSTPORT`** | Kafka instance to connect, requires JMX enabled |


## Docker

Run via the Docker command:

```bash
$ docker run -p 5556:5556 -e "KAFKA_HOSTPORT=<externalIP>:<JMXPort>" fabianbaier/docker_kafka_prometheus_exporter:0.1.0
```


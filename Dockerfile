FROM openjdk:8-jdk

ARG jmx_prometheus_version=0.1.0

MAINTAINER fabianbaier

#RUN apk add --update unzip wget curl docker jq coreutils

ADD prom-jmx-agent-config.yml /usr/app/prom-jmx-agent-config.yml
#ADD http://central.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.1.0/jmx_prometheus_javaagent-0.1.0.jar /usr/app/jmx_prometheus_javaagent.jar
ADD http://supergsego.com/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.zip /usr/app/apache-maven-3.5.2-bin.zip
RUN cd /usr/app && git clone https://github.com/prometheus/jmx_exporter --branch parent-0.1.0
ADD start_exporter.sh /usr/bin/start_exporter.sh


RUN cd /usr/app && unzip /usr/app/apache-maven-3.5.2-bin.zip && cd jmx_exporter && export PATH=/usr/app/apache-maven-3.5.2/bin:$PATH && mvn package

RUN chmod a+x /usr/bin/start_exporter.sh

CMD ["start_exporter.sh"]
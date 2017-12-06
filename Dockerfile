FROM openjdk:8-jdk

ARG jmx_prometheus_version=0.1.0

MAINTAINER fabianbaier


ADD prom-jmx-agent-config.yml /usr/app/prom-jmx-agent-config.yml
ADD http://supergsego.com/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.zip /usr/app/apache-maven-3.5.2-bin.zip
RUN cd /usr/app && git clone https://github.com/prometheus/jmx_exporter --branch parent-0.1.0
ADD start_exporter.sh /usr/bin/start_exporter.sh


RUN cd /usr/app && unzip /usr/app/apache-maven-3.5.2-bin.zip && cd jmx_exporter && export PATH=/usr/app/apache-maven-3.5.2/bin:$PATH && mvn package

RUN chmod a+x /usr/bin/start_exporter.sh

CMD ["start_exporter.sh"]
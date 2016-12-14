FROM tomcat:8.5

ENV JAVA_OPTS="-javaagent:/usr/local/pinpoint-agent/pinpoint-bootstrap-1.6.0.jar -Dpinpoint.agentId=test1 -Dpinpoint.applicationName=test-tomcat"

WORKDIR /usr/local
RUN mkdir -p /usr/local/pinpoint-agent
ADD pinpoint-agent-1.6.0.tar.gz /usr/local/pinpoint-agent
ADD configure-agent.sh /usr/local/bin/

ADD pinpoint.config /usr/local/pinpoint-agent/pinpoint.config
RUN chmod a+x /usr/local/bin/configure-agent.sh

ENTRYPOINT ["/usr/local/bin/configure-agent.sh"]


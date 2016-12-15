#!/bin/bash

docker run -it -d \
--name quickstart-testapp \
-e "JAVA_OPTS=-javaagent:/usr/local/pinpoint-agent/pinpoint-bootstrap-1.6.0.jar -Dpinpoint.agentId=testapp -Dpinpoint.applicationName=quickstart-testapp" \
-e "COLLECTOR_IP=collector" \
--link="pinpoint-collector:collector" \
-p 8081:8080 \
-v $(pwd)/ROOT.war:/usr/local/tomcat/webapps/ROOT.war \
minyk/pinpoint-testapp:1.6.0


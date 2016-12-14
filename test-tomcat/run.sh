#!/bin/bash

docker run -it -d --name test-tomcat -e "COLLECTOR_IP=collector" --link="pinpoint-collector:collector" -p 8081:8080 minyk/pinpoint-test-tomcat:1.6.0

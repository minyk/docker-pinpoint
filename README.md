Docker compose for Pinpoint
===========================

# Deprecated warning

Naver Pinpoint team started to build official docker images, So this repo will not be updated any more. See: https://github.com/naver/pinpoint-docker

# What is Pinpoint

Pinpoint is an APM (Application Performance Management) tool for large-scale distributed systems written in Java. See this: https://github.com/naver/pinpoint

# How to use

* Up the collector, hbas, web
```
$ docker-compose up -d
```

* Up the agent (Pinpoint quickstart testapp)
```
$ test-tomcat/run.sh
```

* Browse `localhost:3080`
* Also visit `localhost:8081` for generating data in `test-tomcat` container.

# Custom

## Custom build of Pinpoint docker images

* Edit below line for image name in `pom.xml` of collector, web, hbase:
```XML
                    <imageName>naver/${project.artifactId}:${project.version}</imageName>
```

* Build with below:
```
$ mvn clean package docker:build -DskipTests
```

* Then browse docker images
```
$ docker images
```

## Custom Webapp

* Copy quickstart-testapp dir to new name
* Replace `ROOT.war` in the directory
* Edit run.sh for container name, port and pinpoint agent id/application name
```
docker run -it -d \
--name quickstart-testapp \
-e "JAVA_OPTS=-javaagent:/usr/local/pinpoint-agent/pinpoint-bootstrap-1.6.0.jar -Dpinpoint.agentId=testapp -Dpinpoint.applicationName=quickstart-testapp" \
-e "COLLECTOR_IP=collector" \
--link="pinpoint-collector:collector" \
-p 8081:8080 \
-v $(pwd)/ROOT.war:/usr/local/tomcat/webapps/ROOT.war \
minyk/pinpoint-testapp:1.6.0
```
* Run!

# Ack

@naver, Thank you for the great tool!

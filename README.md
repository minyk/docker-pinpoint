Docker compose for Pinpoint
===========================

# What is Pinpoint

Pinpoint is an APM (Application Performance Management) tool for large-scale distributed systems written in Java. See this: https://github.com/naver/pinpoint

# How to use

* Up the collector, hbas, web
```
$ docker-compose up -d
```

* Up the agent
```
$ test-tomcat/run.sh
```

* Browse `localhost:3080`
* Also visit `localhost:8081` for generating data in `test-tomcat` container.

# Ack

@naver, Thank you for the great tool!

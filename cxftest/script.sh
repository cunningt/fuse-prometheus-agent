#!/bin/sh

java -javaagent:target/docker/cxftest/latest/build/maven/agent-bond-agent-1.0.2.jar=jmx_exporter{{4545:src/main/resources/config.yml}} -jar target/cxftest-1.0-SNAPSHOT.jar

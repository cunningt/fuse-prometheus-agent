#!/bin/sh

java -javaagent:target/docker/test/latest/build/maven/agent-bond-agent-1.0.2.jar=jmx_exporter{{4545:src/main/resources/config.yml}} -jar target/test-1.0-SNAPSHOT.jar

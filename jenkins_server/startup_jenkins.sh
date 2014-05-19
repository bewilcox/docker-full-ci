#!/bin/bash

## see also https://updates.jenkins-ci.org/download/plugins/ for hpi files
PLUGINS_ENDPOINT=http://updates.jenkins-ci.org/latest/
DATA=/var/lib/jenkins

#mkdir -p $DATA/plugins

#chown jenkins /var/lib/jenkins

if find $DATA/plugins -maxdepth 0 -empty | read v; then
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/m2release.hpi)
fi

#exec su jenkins -c "java -jar /usr/share/jenkins/jenkins.war"
java -jar /usr/share/jenkins/jenkins.war

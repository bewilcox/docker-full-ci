#!/bin/bash

## see also https://updates.jenkins-ci.org/download/plugins/ for hpi files
PLUGINS_ENDPOINT=http://updates.jenkins-ci.org/latest
#DATA=/var/lib/jenkins
DATA=$JENKINS_HOME

#mkdir -p $DATA/plugins

#chown jenkins /var/lib/jenkins


if find $DATA/plugins -maxdepth 0 -empty | read v; then

    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/token-macro.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/jquery-ui.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/jquery.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/parameterized-trigger.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/scm-api.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/greenballs.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/m2release.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/delivery-pipeline-plugin.hpi)    
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/build-pipeline-plugin.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/docker-build-publish.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/docker-build-step.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/docker-plugin.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/git-client.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/git.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/github-api.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/promoted-builds-simple.hpi)
    (cd $DATA/plugins && wget --no-check-certificate $PLUGINS_ENDPOINT/promoted-builds.hpi)
fi

#exec su jenkins -c "java -jar /usr/share/jenkins/jenkins.war"
java -jar /usr/share/jenkins/jenkins.war

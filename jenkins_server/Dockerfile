FROM ubuntu:13.10

# Install packages needed
RUN apt-get update
RUN apt-get install -y git curl maven wget software-properties-common

# Install Java.
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

# Install Jenkins
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install -y jenkins

RUN mkdir -p /var/lib/jenkins/plugins
RUN chmod -R 770 /var/lib/jenkins

ENV JENKINS_HOME /var/lib/jenkins

VOLUME ["/var/lib/jenkins"]

ADD startup_server.sh /startup_server.sh
RUN chmod 700 /startup_server.sh

# Port
EXPOSE 8080

CMD ["/startup_server.sh"]

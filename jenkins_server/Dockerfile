FROM ubuntu:13.10

# Install packages needed
RUN apt-get update
RUN apt-get install -y git curl maven wget

# Add oracle java 7 repository
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get -y update
# Accept the Oracle Java license
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
# Install Oracle Java
RUN apt-get -y install oracle-java7-installer

# Install Jenkins
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install -y jenkins

ENV JENKINS_HOME /var/lib/jenkins

RUN mkdir -p /var/lib/jenkins/plugins
RUN chmod -R 770 /var/lib/jenkins

VOLUME ["/var/lib/jenkins"]

RUN mkdir /home/jenkins
ENV JENKINS_HOME /home/jenkins

ADD startup_server.sh /startup_server.sh
RUN chmod 700 /startup_server.sh

# Port
EXPOSE 8080

CMD ["/startup_server.sh"]

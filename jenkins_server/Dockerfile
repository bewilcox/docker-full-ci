FROM ubuntu:13.10

# Install packages needed
RUN apt-get update
RUN apt-get install -y openjdk-7-jdk git curl maven wget

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

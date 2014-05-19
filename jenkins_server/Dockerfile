FROM julienvey/fullubuntu

# Install packages needed
RUN apt-get update
RUN apt-get install -y openjdk-7-jdk git curl maven wget

# Install Jenkins
RUN wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install -y jenkins

ENV JENKINS_HOME /var/lib/jenkins

EXPOSE 8080

RUN mkdir -p /var/lib/jenkins
RUN chown -R jenkins /var/lib/jenkins

VOLUME ["/var/lib/jenkins"]

ADD startup_jenkins.sh /startup_jenkins.sh
RUN chmod 700 /startup_jenkins.sh

CMD ["/startup_jenkins.sh"]
